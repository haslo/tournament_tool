FactoryGirl.define do

  factory :tournament do
    association :account, strategy: :create
    title 'tournament'
  end

end
