FactoryGirl.define do

  factory :tournament do
    association :account, strategy: :create
    title {|n| "#{n} Tournament"}
    type Android::NetrunnerTournament.name
    tournament_start { 1.hour.ago }
  end

end
