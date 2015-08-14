module Helpers

  def create_site
    click_link('List a new site')
    fill_in 'Name', with: 'ABC Camping'
    fill_in 'Town', with: 'Canterbury'
    fill_in 'Address', with: '123 Old Road'
    fill_in 'Postcode', with: 'NP5 9XY'
    fill_in 'Price', with: 40
    fill_in 'Description', with: 'This is a campsite'
    click_button 'Create Site'
  end

  def sign_up
    visit('/vendors')
    click_link('Sign Up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_2
    visit('/vendors')
    click_link('Sign Up')
    fill_in('Email', with: 'test@mail.com')
    fill_in('Password', with: 'hellohello')
    fill_in('Password confirmation', with: 'hellohello')
    click_button('Sign up')
  end

  def request_booking
    fill_in 'request_customer_name', with: 'Lucy'
    fill_in 'request_customer_email', with: 'hello@mail.com'
    fill_in 'request_customer_phone', with: '071234567'
    fill_in 'request_start_date', with: '03/05/2015'
    fill_in 'request_end_date', with: '09/05/2015'
    fill_in 'request_comments', with: 'Pets allowed?'
  end
end
