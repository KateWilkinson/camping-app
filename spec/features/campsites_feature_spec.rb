require 'rails_helper'

feature 'sites' do
  context 'when a user visits the homepage' do
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

    let!(:abc){Site.create(name:'ABC Camping')}

    scenario 'user clicks on campsite link' do
      visit '/'
      click_link 'ABC Camping'
      expect(page).to have_content 'ABC Camping'
      expect(current_url).to eq "/sites/#{abc.id}"
    end
  end

end
