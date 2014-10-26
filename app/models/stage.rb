class Stage < ActiveRecord::Base

  include Concerns::ModelWithJSONData

  belongs_to :tournament
  has_many :rounds, -> { order(:position) }

  acts_as_list scope: :tournament

  validates :tournament_id, :type, :title, :number_of_rounds, presence: true
  before_validation :fill_number_of_rounds

  def type_name
    self.class.type_name
  end

  def self.type_name
    I18n.t("types.stages.#{type_key}")
  end

  private

  def fill_number_of_rounds
    self.number_of_rounds = 0
  end

end
