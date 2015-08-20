module Helpers

  def create_full_site_2
    click_link('List a new site')
    fill_in 'site[name]', with: 'Eyam Camping'
    fill_in 'site[town]', with: 'Eyam'
    fill_in 'site[postcode]', with: 'DE5 9TY'
    fill_in 'site[price]', with: 60
    fill_in 'site[description]', with: 'Peaceful'
    click_button 'Create site'
  end

  def create_full_site
    click_link('List a new site')
    fill_in 'site[name]', with: 'ABC Camping'
    fill_in 'site[summary]', with: 'family friendly campsite, near the seaside'
    fill_in 'site[description]', with: 'This is a campsite blah blah blah'
    fill_in 'site[street]', with: '13 Pollo Street'
    fill_in 'site[town]', with: 'Canterbury'
    fill_in 'site[county]', with: 'Bucks'
    fill_in 'site[postcode]', with: 'HP81BZ'
    fill_in 'site[price]', with: 40
    select 'Campervan', from: 'site_accommodation_type'
    fill_in 'site[occupancy]', with: 2
    fill_in 'site[available_from]', with: 'March'
    fill_in 'site[available_to]', with: 'October'
    attach_file 'site_image', 'spec/features/test.jpg'
    attach_file 'site_image_2', 'spec/features/test2.jpg'
    check('site[toilet_block]')
    uncheck('site[shower_block]')
    check('site[charging_facilities]')
    click_button 'Create site'
  end

  def sign_up_as_vendor
    visit('/vendors')
    click_link('Sign Up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_as_vendor2
    visit('/vendors')
    click_link('Sign Up')
    fill_in('Email', with: 'test@mail.com')
    fill_in('Password', with: 'hellohello')
    fill_in('Password confirmation', with: 'hellohello')
    click_button('Sign up')
  end

  def request_booking
    visit '/'
    click_link 'ABC Camping'
    click_button 'Book'
    fill_in 'request_customer_name', with: 'Lucy'
    fill_in 'request_customer_email', with: 'hello@mail.com'
    fill_in 'request_customer_phone', with: '071234567'
    select '18', from: 'request_start_date_3i'
    select 'August', from: 'request_start_date_2i'
    select '2016', from: 'request_start_date_1i'
    select '21', from: 'request_end_date_3i'
    select 'August', from: 'request_end_date_2i'
    select '2016', from: 'request_end_date_1i'
    fill_in 'request_comments', with: 'Pets allowed?'
    click_button 'Create Request'
  end

  def log_in_as_vendor
    click_link 'Log In'
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    click_button 'Log in'
  end
end
