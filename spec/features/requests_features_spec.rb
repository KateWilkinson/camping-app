require 'rails_helper'

feature 'requests' do
  context 'when a potential customer' do
    before do
      sign_up
      create_site
    end

    scenario 'clicks on Book button, they are taken to Contact page' do
      visit '/'
      click_link 'ABC Camping'
      click_button 'Book'
      expect(current_path).to eq '/requests/new'
    end

    scenario 'can fill in a form' do
      visit '/'
      click_link 'ABC Camping'
      click_button 'Book'
      expect(page).to have_content 'Name'
      expect(page).to have_button 'Create Request'
    end

    scenario 'submits a request they recieve a message sending request sent' do
      visit '/'
      click_link 'ABC Camping'
      click_button 'Book'
      request_booking
      expect(current_path).to eq '/'
      expect(page).to have_content 'Your request has been made'
    end
  end
end
