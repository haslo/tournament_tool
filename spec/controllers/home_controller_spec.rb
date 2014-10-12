require_relative '../rails_helper'

describe HomeController do

  let(:tournament) { FactoryGirl.create(:tournament) }

  describe 'GET show' do
    it 'redirects to the correct tournament with show_key' do
      get(:show, id: tournament.show_key)
      expect(controller.shown_tournament).to eq(tournament)
      assert_redirected_to "/tournaments/#{tournament.show_key}"
    end

    it 'redirects to the correct tournament with admin_key' do
      get(:show, id: tournament.admin_key)
      expect(controller.admin_tournament).to eq(tournament)
      assert_redirected_to "/tournaments/#{tournament.admin_key}/edit"
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
      expect(controller.admin_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/'
    end
  end

end
