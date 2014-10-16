class Account < ActiveRecord::Base

  has_many :leagues
  has_many :tournaments
  has_many :stages, through: :tournaments

  include Gravtastic
  has_gravatar

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

end
