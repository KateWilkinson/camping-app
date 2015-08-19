require 'rails_helper'

feature 'sites' do
  context 'when a user visits the homepage' do

    let!(:abc){Site.create(name:'ABC Camping', town: 'Glastonbury', postcode: 'BA4 6TA', description: 'Not bad', price: 300)}

    scenario 'view homepage' do
      visit '/'
      expect(page).to have_css('#header')
    end

    scenario 'view links list' do
      visit '/'
      expect(page).to have_link 'ABC Camping'
    end
  end

  context 'when user wants details on a campsite' do

    let!(:abc){Site.create(name:'ABC Camping', town: 'Glastonbury', postcode: 'BA4 6TA', description: 'Not bad', price: 300)}

    scenario 'user clicks on campsite link' do
      visit '/'
      click_link 'ABC Camping'
      expect(page).to have_content 'ABC Camping'
      expect(current_path).to eq "/sites/#{abc.id}"
    end

    scenario 'they should be able to return to the listings page' do
      visit '/'
      click_link 'ABC Camping'
      click_button 'Back'
      expect(current_path).to eq '/sites'
      expect(page).to have_content 'Camping Emporium'
    end
  end

  context 'when user conducts a search on town' do
    let!(:abc){Site.create(name:'ABC Camping', town: 'Glastonbury', county: 'Somerset', postcode: 'BA4 6TA', description: 'Not bad', price: 300)}
    let!(:xyz){Site.create(name:'XYZ Camping', town: 'Cambridge', county: 'Somerset', postcode: 'BA4 6TA', description: 'Not bad', price: 300)}

    scenario 'user enters town as search query' do
      visit '/'
      fill_in('search', with: 'Glastonbury')
      click_link('Find Sites')
      expect(page).to have_content('ABC Camping')
      expect(page).not_to have_content('XYZ Camping')
    end
  end

end
