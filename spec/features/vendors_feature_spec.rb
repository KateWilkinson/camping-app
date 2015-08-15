require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

feature 'A vendor can sign up' do
  context 'when not signed in' do
    scenario 'should see a log in link and a sign up link on vendors index' do
      visit('/vendors')
      expect(page).to have_link('Sign Up')
      expect(page).to have_link('Log In')
    end

    scenario 'should see a Vendor link on the homepage' do
      visit '/'
      expect(page).to have_link('Vendor')
      click_link 'Vendor'
      expect(current_path).to eq '/vendors'
    end

    scenario 'should not see a sign out link on vendors index' do
      visit('/vendors')
      expect(page).not_to have_link('Log Out')
    end
  end

  context 'when signed in' do
    before do
      visit('/vendors')
      click_link('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario 'should see a log out link' do
      expect(page).to have_link 'Log Out'
    end
  end

  context 'when signed up but not logged in' do
    before do
      visit('/vendors')
      click_link('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      click_link 'Log Out'
    end

    scenario 'should be able to log in and be redirected to vendors index page' do
      visit '/vendors'
      click_link 'Log In'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest'
      click_button 'Log in'
      expect(current_path).to eq '/vendors'
    end
  end
end

feature 'While logged in a vendor can' do

  scenario 'acccess the list page and return to the vendor home page' do
    sign_up_as_vendor
    click_link 'Return to list'
    expect(current_path).to eq '/'
    click_link 'Vendor'
    expect(current_path).to eq '/vendors'
  end

  scenario 'access the list and will stay logged in' do
    sign_up_as_vendor
    click_link 'Return to list'
    expect(current_path).to eq '/'
    click_link 'Vendor'
    expect(current_path).to eq '/vendors'
    expect(page).to have_content 'Log Out'
  end

  scenario 'add a site and should see it on the listings page' do
    sign_up_as_vendor
    create_site
    click_link 'Return to list'
    expect(current_path).to eq '/'
    expect(page).to have_content 'ABC Camping'
  end

  context 'add campsites' do

    scenario 'and should see it on the vendor index' do
      sign_up_as_vendor
      create_site
      expect(page).to have_content 'ABC Camping'
      expect(current_path).to eq '/vendors'
    end

    scenario 'should not see other peoples campsites on the vendor index' do
      sign_up_as_vendor
      create_site
      click_link 'Log Out'
      sign_up_as_vendor2
      expect(page).not_to have_content 'ABC Camping'
    end

    scenario 'should not be able to add a campsite with a duplicate name' do
      sign_up_as_vendor
      create_site
      create_site
      expect(page).to have_content 'Name has already been taken'
    end

    scenario 'should be able to add an address' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_content('13 Pollo Street Canterbury Bucks HP81BZ')
    end

    scenario 'should be able to add price per night' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_content('£40')
    end

    scenario 'should be able to select accomodation type' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_content('Campervan')
    end

    scenario 'should be able to add occupancy' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_content('2 people')
    end

    scenario 'complete a short and full description' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_content('family friendly campsite, near the seaside')
      expect(page).to have_content('This is a campsite blah blah blah')
    end

    scenario 'should be able to add occupancy' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_content('March to October')
    end

    scenario 'should be able to successfully upload an image' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_selector("img[src*='test.jpg']")
    end

    scenario 'should be able to successfully upload multiple images' do
      sign_up_as_vendor
      create_full_site
      expect(page).to have_selector("img[src*='test.jpg']")
      expect(page).to have_selector("img[src*='test2.jpg']")
    end

    scenario 'should be able to check or uncheck different facilities/amenities' do
      #TODO - all all familities/entertainment/amenties tests? How to test for this as only checking class at moment
      sign_up_as_vendor
      create_full_site
      expect(page).to have_css('.has-facility')
      expect(page).to have_css('.no-facility')
    end

  end

  context 'edit campsites' do
    scenario 'vendors can edit their campsites' do
      sign_up_as_vendor
      create_site
      click_link 'Edit Site'
      fill_in 'Name', with: 'CBA Camping'
      click_button 'Update Site'
      expect(page).to have_content 'CBA Camping'
      expect(page).not_to have_content 'ABC Camping'
    end
  end

  context 'delete campsites' do
    scenario 'vendors can delete their campsites' do
      sign_up_as_vendor
      create_site
      click_link 'Delete Site'
      expect(current_path).to eq '/vendors'
      expect(page).not_to have_content 'ABC Camping'
    end

    scenario 'they should also be removed from the listings page' do
      sign_up_as_vendor
      create_site
      click_link 'Delete Site'
      click_link 'Return to list'
      expect(page).not_to have_content 'ABC Camping'
    end
  end



end
