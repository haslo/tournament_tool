require_relative '../rails_helper'

describe Tournament do
  subject { FactoryGirl.build(:tournament) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  context 'admin_key' do
    before(:each) do
      expect(subject.admin_key).to be_blank
      subject.save
    end

    it 'is automatically built upon save' do
      expect(subject.admin_key).to be_present
    end

    it 'is 20 random characters long' do
      expect(subject.admin_key).to match(/[0-9a-zA-Z]{12}/)
    end

    it 'generates an unique key each time it is called' do
      1000.times do
        FactoryGirl.create(:tournament)
      end
      expect(Tournament.all.map(&:admin_key).uniq.count).to eq(Tournament.count)
    end
  end
end
