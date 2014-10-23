class Stage < ActiveRecord::Base

  belongs_to :tournament
  has_many :rounds

  validates :tournament_id, :type, :number_of_rounds, presence: true

end
