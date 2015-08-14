require 'rails_helper'

feature 'requests' do
  context 'when potential customer' do

    let!(:abc){Site.create(name:'ABC Camping', address: '123 Station Road', town: 'Glastonbury', postcode: 'BA4 6TA', description: 'Not bad', price: 300)}

    scenario 'clicks on Book Now button, they are taken to Contact page' do
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
  end
end
