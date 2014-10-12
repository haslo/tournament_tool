require_relative '../rails_helper'

describe TournamentsController do

  let(:tournament) { FactoryGirl.create(:tournament) }

  describe 'GET show' do
    it 'loads the correct tournament with show_key' do
      get(:show, id: tournament.show_key)
      expect(controller.shown_tournament).to eq(tournament)
    end

    it 'loads the correct tournament with admin_key' do
      get(:show, id: tournament.admin_key)
      expect(controller.admin_tournament).to eq(tournament)
      expect(controller.shown_tournament).to eq(tournament)
    end

    it 'redirects to index with bogus value' do
      get(:show, id: 'bogus')
      expect(controller.shown_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/tournaments'
    end

    it 'redirects to index with id' do
      get(:show, id: tournament.id)
      expect(controller.shown_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/tournaments'
    end
  end

  describe 'GET edit' do
    it 'loads the correct tournament with admin_key' do
      get(:edit, id: tournament.admin_key)
      expect(controller.admin_tournament).to eq(tournament)
    end

    it 'redirects to show with show_key' do
      get(:edit, id: tournament.show_key)
      expect(controller.admin_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to "/tournaments/#{tournament.show_key}"
    end

    it 'redirects to index with bogus value' do
      get(:edit, id: 'bogus')
      expect(controller.shown_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/tournaments'
    end

    it 'redirects to index with id' do
      get(:edit, id: tournament.id)
      expect(controller.shown_tournament).to be nil
      expect(response.status).to eq(302)
      assert_redirected_to '/tournaments'
    end
  end

end
