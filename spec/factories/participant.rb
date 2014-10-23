FactoryGirl.define do

  factory :participant do
    association :tournament, strategy: :create
    first_name 'Fritz'
    last_name 'Meier'
    type Android::NetrunnerParticipant.name

    factory :netrunner_participant, class: Android::NetrunnerParticipant, parent: :participant do
    end
  end

end
