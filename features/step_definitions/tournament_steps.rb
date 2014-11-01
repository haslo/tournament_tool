When(/^I click the (\d+)(?:st|nd|rd) tournament's "(.*?)" link$/) do |index, link_name|
  TournamentList.new(self).click_tournament_link(index, link_name)
end

Then(/^I should see (\d+) tournaments in the list$/) do |count|
  expect(TournamentList.new(self).count_tournaments).to eq(count)
end
