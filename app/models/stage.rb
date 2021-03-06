class Stage < ActiveRecord::Base

  include Concerns::ModelWithJSONData

  belongs_to :tournament
  has_many :rounds, -> { order(:position) }

  acts_as_list scope: :tournament

  validates :tournament_id,
            :type,
            :title,
            :number_of_rounds,
            :stage_start,
            :stage_end,
            :number_of_rounds,
            :minutes_per_round,
            :minutes_per_break,
            presence: true

  before_validation :update_times

  def type_name
    self.class.type_name
  end

  def type_description
    self.class.type_description
  end

  def self.type_name
    I18n.t("types.stages.#{type_key}.name")
  end

  def self.type_description
    I18n.t("types.stages.#{type_key}.description")
  end

  def number_of_participants
    [
      maximum_number_of_participants,
      tournament.maximum_participants_at(self.position)
    ].reject(&:blank?).min
  end

  def update_times
    unless self.number_of_rounds.blank? || self.minutes_per_round.blank?
      if self.position.blank? || self.position == 1
        self.stage_start = tournament.tournament_start
      else
        last_stage = tournament.stages.where(position: self.position - 1).first
        self.stage_start = last_stage.stage_end + (last_stage.minutes_per_break.minutes || self.tournament.default_minutes_per_break)
      end
      self.minutes_per_break ||= self.tournament.default_minutes_per_break
      rounds_time = self.number_of_rounds * self.minutes_per_round.minutes
      breaks_time = (self.number_of_rounds - 1) * self.minutes_per_break.minutes
      self.stage_end = self.stage_start + rounds_time + breaks_time
    end
  end

end
