require_relative 'page_object'

class ScheduleTab < ::PageObject

  def number_of_stages
    all('div.stage-row').count
  end

end
