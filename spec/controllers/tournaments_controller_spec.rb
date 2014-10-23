describe TournamentsController do

  include Devise::TestHelpers

  let(:tournament) { FactoryGirl.create(:tournament) }

  describe 'GET show' do
    it 'loads the correct tournament with show_key' do
      get(:show, id: tournament.show_key)
      expect(controller.shown_tournament.id).to eq(tournament.id)
    end

    it 'redirects to index with bogus value' do
      get(:show, id: 'bogus')
      expect(controller.shown_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/'
    end

    it 'redirects to index with id' do
      get(:show, id: tournament.id)
      expect(controller.shown_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/'
    end
  end

end
