class Participant < ActiveRecord::Base

  include Concerns::ModelWithJSONData

  belongs_to :tournament
  validates :first_name, :last_name, presence: true

end
