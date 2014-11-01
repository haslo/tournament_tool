Then(/^I should see an error for the field "(.*?)"$/) do |field_id|
  Form.new(self).expect_field_with_error(field_id)
end
