Given(/^the following (.*) models:$/) do |model_name, table|
  table.hashes.each do |model_hash|
    FactoryGirl.create(model_name.singularize.downcase.to_sym, model_hash)
  end
end

Given(/^all your (.*) are belong to me$/) do |model_name|
  model_name.singularize.constantize.all.each do |model|
    model.update_attribute(:account_id, Account.where(email: 'logged@in.net').first.id)
  end
end
