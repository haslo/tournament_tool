describe Android::NetrunnerParticipant do
  subject { FactoryGirl.build(:netrunner_participant) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  it_behaves_like 'uses JSON data'

end
