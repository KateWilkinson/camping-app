module Helpers

  def create_site
    click_link('List a new site')
    fill_in 'Name', with: 'ABC Camping'
    fill_in 'Town', with: 'Canterbury'
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

end