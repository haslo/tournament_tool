class Account < ActiveRecord::Base

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
