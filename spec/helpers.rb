module Helpers

  def create_site
    click_link('List a new site')
    fill_in 'site[name]', with: 'ABC Camping'
    fill_in 'site[town]', with: 'Canterbury'
    fill_in 'site[postcode]', with: 'NP5 9XY'
    fill_in 'site[price]', with: 40
    fill_in 'site[description]', with: 'This is a campsite'
    click_button 'Create Site'
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

    check('site[shared_toilets]')
    uncheck('site[private_shower]')
    check('site[electricity]')
    attach_file 'site_image', 'spec/features/test.jpg'
    attach_file 'site_image_2', 'spec/features/test2.jpg'

    click_button 'Create Site'
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
    fill_in 'request_customer_name', with: 'Lucy'
    fill_in 'request_customer_email', with: 'hello@mail.com'
    fill_in 'request_customer_phone', with: '071234567'
    fill_in 'request_start_date', with: '03/05/2015'
    fill_in 'request_end_date', with: '09/05/2015'
    fill_in 'request_comments', with: 'Pets allowed?'
  end

end
