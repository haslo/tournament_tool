describe Tournament do
  subject { FactoryGirl.build(:tournament) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  context 'show_key' do
    before(:each) do
      expect(subject.show_key).to be_blank
      subject.save
    end

    it 'is automatically built upon save' do
      expect(subject.show_key).to be_present
    end

    it 'is 14 random characters long' do
      expect(subject.show_key).to match(/\A[0-9a-zA-Z\-_]{14}\Z/)
    end

    it 'generates an unique key each time it is called' do
      100.times do
        FactoryGirl.create(:tournament)
      end
      expect(Tournament.all.map(&:show_key).uniq.count).to eq(Tournament.count)
    end
  end

end
