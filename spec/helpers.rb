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
    # fill_in 'Address Line 1', with: '13 Pollo Street'
    # fill_in 'Town/City', with: 'Canterbury'

    # fill_in 'County', with: 'Buckinghamshire'
    # find("option[value='Buckinghamshire']").click
    select 'Campervan', from: 'site_accommodation_type'

    # fill_in 'Postcode', with: 'NP5 9XY'
    # fill_in 'Price', with: 40
    # fill_in 'Available from', with: 'March'
    # fill_in 'to', with: 'October'
    # fill_in 'Occupany', with: 2

    # accomodation type

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

end
