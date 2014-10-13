class Pairing < ActiveRecord::Base

  belongs_to :round
  belongs_to :participant_1, foreign_key: 'participant_1_id', class_name: 'Participant'
  belongs_to :participant_2, foreign_key: 'participant_2_id', class_name: 'Participant'

end
