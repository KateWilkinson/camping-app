require 'rails_helper'

feature 'Vendor can sign in and out' do
  context 'Vendor not signed in' do
    it 'should see a log in link and a sign up link' do
      visit('/vendors')
      expect(page).to have_link('Sign Up')
      expect(page).to have_link('Log In')
    end
  end
end