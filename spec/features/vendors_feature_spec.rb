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

feature 'While logged in a vendor can' do
  before do
    visit('/vendors')
    click_link('Sign Up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'acccess the list page and return to the vendor home page' do
    click_link 'Return to list'
    expect(current_path).to eq '/'
    click_link 'Vendor'
    expect(current_path).to eq '/vendors'
  end

  it 'access the list and will stay logged in' do
    click_link 'Return to list'
    expect(current_path).to eq '/'
    click_link 'Vendor'
    expect(current_path).to eq '/vendors'
    expect(page).to have_content 'Log Out'
  end

  it 'add a site and should see it on the listings page' do
    click_link('List a new site')
    fill_in 'Name', with: 'ABC Camping'
    fill_in 'Town', with: 'Canterbury'
    fill_in 'Address', with: '123 Old Road'
    fill_in 'Postcode', with: 'NP5 9XY'
    fill_in 'Price', with: 40
    fill_in 'Description', with: 'This is a campsite'
    click_button 'Create Site'
    click_link 'Return to list'
    expect(current_path).to eq '/'
    expect(page).to have_content 'ABC Camping'
  end

  context 'add campsites' do
    it 'and should see it on the vendor index' do
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

    it 'should not see other peoples campsites on the vendor index' do
      # WRITE THIS TEST LATER
    end
  end

  context 'edit campsites' do
    it 'vendors can edit their campsites' do
      click_link('List a new site')
      fill_in 'Name', with: 'ABC Camping'
      fill_in 'Town', with: 'Canterbury'
      fill_in 'Address', with: '123 Old Road'
      fill_in 'Postcode', with: 'NP5 9XY'
      fill_in 'Price', with: 40
      fill_in 'Description', with: 'This is a campsite'
      click_button 'Create Site'
      click_link 'Edit Site'
      fill_in 'Name', with: 'CBA Camping'
      click_button 'Update Site'
      expect(page).to have_content 'CBA Camping'
      expect(page).not_to have_content 'ABC Camping'
    end
  end

  context 'delete campsites' do
    it 'vendors can delete their campsites' do
      click_link('List a new site')
      fill_in 'Name', with: 'ABC Camping'
      fill_in 'Town', with: 'Canterbury'
      fill_in 'Address', with: '123 Old Road'
      fill_in 'Postcode', with: 'NP5 9XY'
      fill_in 'Price', with: 40
      fill_in 'Description', with: 'This is a campsite'
      click_button 'Create Site'
      click_link 'Delete Site'
      expect(current_path).to eq '/vendors'
      expect(page).not_to have_content 'ABC Camping'
    end

    it 'they should also be removed from the listings page' do
      click_link('List a new site')
      fill_in 'Name', with: 'ABC Camping'
      fill_in 'Town', with: 'Canterbury'
      fill_in 'Address', with: '123 Old Road'
      fill_in 'Postcode', with: 'NP5 9XY'
      fill_in 'Price', with: 40
      fill_in 'Description', with: 'This is a campsite'
      click_button 'Create Site'
      click_link 'Delete Site'
      click_link 'Return to list'
      expect(page).not_to have_content 'ABC Camping'
    end
  end
end
