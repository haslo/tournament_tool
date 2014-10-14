FactoryGirl.define do

  factory :account do
    sequence(:email) { |n| "test#{n}@mail.com" }
    password 'passpass'
    password_confirmation 'passpass'
  end

end
