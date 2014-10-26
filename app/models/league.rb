class League < ActiveRecord::Base

  belongs_to :account
  has_many :tournaments, -> { order(:position) }

  validates :title, :account_id, presence: true

end
