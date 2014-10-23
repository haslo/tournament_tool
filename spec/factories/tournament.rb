FactoryGirl.define do

  factory :tournament do
    association :account, strategy: :create
    title 'tournament'
    type Android::NetrunnerTournament.name
  end

end
