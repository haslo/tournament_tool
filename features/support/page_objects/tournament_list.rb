require_relative 'page_object'

class TournamentList < ::PageObject

  def count_tournaments
    tournament_list.count
  end

  def click_tournament_link(index, link_name)
    tournament_list[index].click_link(link_name)
  end

  private

  def tournament_list
    find('#tournaments-table').find('tbody').all('tr')
  end

end
