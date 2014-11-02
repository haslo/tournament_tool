Given(/^the following (.*) models:$/) do |model_name, table|
  table.hashes.each do |model_hash|
    FactoryGirl.create(model_name.singularize.downcase.to_sym, model_hash)
  end
end

Given(/^all your (.*) are belong to me$/) do |model_name|
  model_name.camelize.singularize.constantize.all.each do |model|
    model.update_attribute(:account_id, Account.where(email: 'logged@in.net').first.id)
  end
end

Then(/^there should be (\d+) (.*)$/) do |count, model_name|
  expect(model_name.camelize.singularize.constantize.count).to eq(count.to_i)
end
