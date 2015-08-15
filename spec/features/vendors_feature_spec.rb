require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

feature 'A vendor can sign up' do
  context 'when not signed in' do
    it 'should see a log in link and a sign up link on vendors index' do
      visit('/vendors')
      expect(page).to have_link('Sign Up')
      expect(page).to have_link('Log In')
    end

    it 'should see a Vendor link on the homepage' do
      visit '/'
      expect(page).to have_link('Vendor')
      click_link 'Vendor'
      expect(current_path).to eq '/vendors'
    end

    it 'should not see a sign out link on vendors index' do
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

    it 'should see a log out link' do
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

    it 'should be able to log in and be redirected to vendors index page' do
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

  it 'acccess the list page and return to the vendor home page' do
    sign_up
    click_link 'Return to list'
    expect(current_path).to eq '/'
    click_link 'Vendor'
    expect(current_path).to eq '/vendors'
  end

  it 'access the list and will stay logged in' do
    sign_up
    click_link 'Return to list'
    expect(current_path).to eq '/'
    click_link 'Vendor'
    expect(current_path).to eq '/vendors'
    expect(page).to have_content 'Log Out'
  end

  it 'add a site and should see it on the listings page' do
    sign_up
    create_site
    click_link 'Return to list'
    expect(current_path).to eq '/'
    expect(page).to have_content 'ABC Camping'
  end

  context 'add campsites' do
    it 'and should see it on the vendor index' do
      sign_up
      create_site
      expect(page).to have_content 'ABC Camping'
      expect(current_path).to eq '/vendors'
    end

    it 'should not see other peoples campsites on the vendor index' do
      sign_up
      create_site
      click_link 'Log Out'
      sign_up_2
      expect(page).not_to have_content 'ABC Camping'
    end

    it 'should not be able to add a campsite with a duplicate name' do
      sign_up
      create_site
      create_site
      expect(page).to have_content 'Name has already been taken'
    end

    scenario 'should be able to successfully upload an image' do
      sign_up
      click_link('List a new site')
      fill_in 'Name', with: 'ABC Camping'
      fill_in 'Town', with: 'Canterbury'
      fill_in 'Postcode', with: 'NP5 9XY'
      fill_in 'Price', with: 40
      fill_in 'Description', with: 'This is a campsite'
      attach_file 'site_image', 'spec/features/test.jpg'
      click_button 'Create Site'
      expect(page).to have_selector("img[src*='test.jpg']")
    end

    scenario 'should be able to succesfully upload multiple images' do
      pending
      sign_up
      click_link('List a new site')
      fill_in 'Name', with: 'ABC Camping'
      fill_in 'Town', with: 'Canterbury'
      fill_in 'Postcode', with: 'NP5 9XY'
      fill_in 'Price', with: 40
      fill_in 'Description', with: 'This is a campsite'
      attach_file 'site_image', 'spec/features/test.jpg'
      attach_file 'site_image_2', 'spec/features/test2.jpg'
      click_button 'Create Site'
      expect(page).to have_selector("img[src*='test.jpg']")
      expect(page).to have_selector("img[src*='test2.jpg']")
    end
  end

  context 'edit campsites' do
    it 'vendors can edit their campsites' do
      sign_up
      create_site
      click_link 'Edit Site'
      fill_in 'Name', with: 'CBA Camping'
      click_button 'Update Site'
      expect(page).to have_content 'CBA Camping'
      expect(page).not_to have_content 'ABC Camping'
    end
  end

  context 'delete campsites' do
    it 'vendors can delete their campsites' do
      sign_up
      create_site
      click_link 'Delete Site'
      expect(current_path).to eq '/vendors'
      expect(page).not_to have_content 'ABC Camping'
    end

    it 'they should also be removed from the listings page' do
      sign_up
      create_site
      click_link 'Delete Site'
      click_link 'Return to list'
      expect(page).not_to have_content 'ABC Camping'
    end
  end



end
