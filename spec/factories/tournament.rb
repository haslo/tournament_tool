FactoryGirl.define do

  factory :tournament do
    title 'tournament'
    description 'description'
    tournament_start { Time.zone.now }
  end

end
