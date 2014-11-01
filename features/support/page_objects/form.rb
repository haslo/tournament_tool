require_relative 'page_object'

class Form < ::PageObject

  def expect_field_with_error(field_id)
    expect(all('.field_with_errors').detect do |field_with_errors|
      field_with_errors.has_css?("##{field_id}")
    end).not_to be nil
  end

end
