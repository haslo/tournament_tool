require_relative 'page_object'

class SignupTab < ::PageObject

  def add_participant(first_name, last_name, email)
    fill_in('participant_first_name', with: first_name)
    fill_in('participant_last_name', with: last_name)
    fill_in('participant_email', with: email)
    click_button('Create')
  end

  def participant_count
    all('div.participant-row').count - 1
  end

  def participant_info(index)
    row = all('div.participant-row')[index]
    {
      'first_name' => row.find_field('First name').value,
      'last_name' => row.find_field('Last name').value,
      'email' => row.find_field('Email').value
    }
  end

end
