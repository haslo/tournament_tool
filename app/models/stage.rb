class Stage < ActiveRecord::Base

  belongs_to :tournament
  has_many :rounds

  validates :tournament_id, :type, presence: true

  def type_name
    self.class.type_name
  end

  def self.type_name
    I18n.t("types.stages.#{type_key}")
  end

end
