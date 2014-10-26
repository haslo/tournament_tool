class Participant < ActiveRecord::Base

  include Concerns::ModelWithJSONData

  belongs_to :tournament

  acts_as_list scope: :tournament

  validates :tournament_id, :type, presence: true

end
