require 'rails_helper'

feature 'Vendor can sign in and out' do
  context 'Vendor not signed in' do
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

  context 'Vendor is signed in' do
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
end

feature 'Vendor can log in and out' do
  context 'Vendor signed up but not logged in' do
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

feature 'Vendor can add campsites' do
  context 'when logged in' do
    before do
      visit('/vendors')
      click_link('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it 'should be able to add a campsite and see it on the vendor index' do
      click_link('List a new site')
      fill_in 'Name', with: 'ABC Camping'
      fill_in 'Town', with: 'Canterbury'
      fill_in 'Address', with: '123 Old Road'
      fill_in 'Postcode', with: 'NP5 9XY'
      fill_in 'Price', with: 40
      fill_in 'Description', with: 'This is a campsite'
      click_button 'Create Site'
      expect(page).to have_content 'ABC Camping'
      expect(current_path).to eq '/vendors'
    end
  end
end
