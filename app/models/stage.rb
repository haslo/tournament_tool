class Stage < ActiveRecord::Base

  include Concerns::ModelWithJSONData

  belongs_to :tournament
  has_many :rounds, -> { order(:position) }

  acts_as_list scope: :tournament

  validates :tournament_id, :type, :title, :number_of_rounds, presence: true

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

end
