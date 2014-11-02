When(/^I click the (\d+)(?:st|nd|rd) tournament's "(.*?)" link$/) do |index, link_name|
  TournamentList.new(self).click_tournament_link(index.to_i - 1, link_name)
end

Then(/^I should see (\d+) tournaments in the list$/) do |count|
  expect(TournamentList.new(self).count_tournaments).to eq(count.to_i)
end

Then(/^I should see the following tabs:$/) do |tabs_table|
  expected_tab_names = tabs_table.hashes.map{|item| item[:name]}
  expected_tab_classes = tabs_table.hashes.map{|item| item[:active].strip == 'X' ? 'active' : ''}
  expect(find('ul.nav-tabs').all('li').map(&:text)).to eq(expected_tab_names)
  expect(find('ul.nav-tabs').all('li').map{|x|x[:class]}).to eq(expected_tab_classes)
end

When(/^I sign up for the following participants?:$/) do |table|
  signup_tab = SignupTab.new(self)
  table.hashes.each do |participant|
    signup_tab.add_participant(participant[:first_name], participant[:last_name], participant[:email])
  end
end

Then(/^I should see the following participants:$/) do |participants|
  signup_tab = SignupTab.new(self)
  expect(signup_tab.participant_count).to eq(participants.hashes.count)
  participants.hashes.each_with_index do |participant, index|
    expect(signup_tab.participant_info(index)).to eq(participant)
  end
end
