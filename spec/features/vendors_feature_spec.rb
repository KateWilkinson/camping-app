require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

feature 'A vendor can sign up,' do
  context 'when not logged in' do

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

    scenario 'should not see any sites' do
      visit '/vendors'
      expect(page).not_to have_content 'Edit Site'
    end

    scenario 'should not see any requests' do
      visit '/vendors'
      expect(page).not_to have_content 'requests'
    end
  end

  context 'when signed in' do
    before do
      sign_up_as_vendor
      create_full_site
    end

    scenario 'should see a log out link' do
      expect(page).to have_link 'Log Out'
    end

    scenario 'should see a request link if site created' do
      expect(page).to have_link 'Booking Requests'
      click_link 'Booking Requests'
      expect(current_path).to eq '/requests'
    end

    scenario 'should see a preview link if site created' do
      pending "until MVP 3 is started"
      expect(page).to have_link 'Preview Site'
      click_link 'Preview Site'
      expect(current_path).to eq '/vendor/preview/sites/3'
    end

    scenario 'they can log out and should be redirected to the listings page' do
      visit '/vendors'
      click_link 'Log Out'
      expect(current_path).to eq '/'
    end
  end
end

feature 'While logged in a vendor can' do
  before do
    sign_up_as_vendor
    create_full_site
  end

  context 'navigate the site by' do

    scenario 'clicking the list page and return to the vendor home page' do
      click_link 'Return to list'
      expect(current_path).to eq '/'
      click_link 'Vendor'
      expect(current_path).to eq '/vendors'
    end

    scenario 'clicking the list and will stay logged in' do
      click_link 'Return to list'
      expect(current_path).to eq '/'
      click_link 'Vendor'
      expect(current_path).to eq '/vendors'
      expect(page).to have_content 'Log Out'
    end

    scenario 'clicking a site and should see it on the listings page' do
      click_link 'Return to list'
      expect(current_path).to eq '/'
      expect(page).to have_content 'ABC Camping'
    end
  end

  context 'add campsites' do

    scenario 'and should see it on the vendor index' do
      expect(page).to have_content 'ABC Camping'
      expect(current_path).to eq '/vendors'
    end

    scenario 'should not see other peoples campsites on the vendor index' do
      click_link 'Log Out'
      sign_up_as_vendor2
      expect(page).not_to have_content 'ABC Camping'
    end

    scenario 'should not be able to add a campsite with a duplicate name' do
      create_full_site
      expect(page).to have_content 'Name has already been taken'
    end

    scenario 'should be able to add an address' do
      expect(page).to have_content('13 Pollo Street Canterbury Bucks HP81BZ')
    end

    scenario 'should be able to add price per night' do
      expect(page).to have_content('£40')
    end

    scenario 'should be able to select accomodation type' do
      expect(page).to have_content('Campervan')
    end

    scenario 'should be able to add occupancy' do
      expect(page).to have_content('2 people')
    end

    scenario 'complete a short and full description' do
      expect(page).to have_content('family friendly campsite, near the seaside')
      expect(page).to have_content('This is a campsite blah blah blah')
    end

    scenario 'should be able to add occupancy' do
      expect(page).to have_content('March to October')
    end

    scenario 'should be able to successfully upload an image' do
      expect(page).to have_selector("img[src*='test.jpg']")
    end

    scenario 'should be able to successfully upload multiple images' do
      expect(page).to have_selector("img[src*='test.jpg']")
      expect(page).to have_selector("img[src*='test2.jpg']")
    end

    scenario 'should be able to check/tick a facility/amenity' do
      expect(page).to have_content('Shared toilets')
      expect(page).to have_css('.has-facility')
    end

    scenario 'should be able to tick more than one facility/amenity' do
      expect(page).to have_content('Shared toilets')
      expect(page).to have_content('Charging facilities')
      expect(page).to have_css('.has-facility')
    end

    scenario 'should be able to uncheck facility/amenity' do
      expect(page).to have_css('.no-facility')
    end
  end

  context 'edit campsites' do

    scenario 'vendors can edit their campsites' do
      click_link 'Edit Site'
      fill_in 'Name', with: 'CBA Camping'
      click_button 'Update Site'
      expect(page).to have_content 'CBA Camping'
      expect(page).not_to have_content 'ABC Camping'
    end
  end

  context 'delete campsites' do

    scenario 'vendors can delete their campsites' do
      click_link 'Delete Site'
      expect(current_path).to eq '/vendors'
      expect(page).not_to have_content 'ABC Camping'
    end

    scenario 'they should also be removed from the listings page' do
      click_link 'Delete Site'
      click_link 'Return to list'
      expect(page).not_to have_content 'ABC Camping'
    end
  end

  context 'view requests' do
    before do
      request_booking
      visit '/vendors'
      click_link 'Booking Requests'
    end

    scenario 'should have a section for confirmed bookings' do
      expect(page).to have_content 'Bookings'
    end

    scenario 'should have a seciont for requests' do
      expect(page).to have_content 'Requests'
    end

    scenario 'for all sites at once' do
      expect(page).to have_content 'Requests for ABC Camping'
    end

    scenario 'should be told if no requests have been made for a particular site' do
      visit '/vendors'
      create_full_site_2
      click_link 'Booking Requests'
      expect(page).to have_content  'No current requests'
    end

    scenario 'the vendor should be able to check these off when dealt with' do
      expect(page).to have_content ''
    end

    scenario 'should be able to return to vendor index page' do
      click_button 'Return'
      expect(current_path).to eq '/vendors'
    end

    scenario 'should be able to delete requests once dealt with' do
      click_button 'Delete Request'
      expect(page).not_to have_content 'Customer Name: Lucy'
      expect(page).to have_content 'Requests'
    end

    scenario 'should be able to make requests confirmed bookings' do
      pending "until MVP 3 is started"
      click_button 'Confirm Booking'
      expect(page).to have_content 'This booking is confirmed'
    end
  end
end
