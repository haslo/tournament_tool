class Participant < ActiveRecord::Base

  belongs_to :tournament
  validates :first_name, :last_name, presence: true

end
