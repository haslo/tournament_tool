class Round < ActiveRecord::Base

  belongs_to :stage
  has_many :pairings

  acts_as_list scope: :stage

end
