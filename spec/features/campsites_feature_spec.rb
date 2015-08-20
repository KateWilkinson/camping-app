require 'rails_helper'

feature 'homepage and search' do
  let!(:abc){Site.create(name:'ABC Camping', town: 'Glastonbury', county: 'Somerset', postcode: 'BA4 6TA', description: 'Not bad', price: 300, forest: true, lake: false)}
  let!(:def){Site.create(name:'DEF Camping', town: 'Glastonbury', county: 'Somerset', postcode: 'BA4 6TA', description: 'Not bad', price: 300, forest: false, lake: true)}
  let!(:ghi){Site.create(name:'GHI Camping', town: 'Glastonbury', county: 'Kent', postcode: 'TN25 7DS', description: 'Not bad', price: 300, forest: true, lake: true)}
  let!(:xyz){Site.create(name:'XYZ Camping', town: 'Cambridge', county: 'Somerset', postcode: 'BA4 6TA', description: 'Not bad', price: 300, forest: false, lake: true)}

  context 'when a user visits the website' do

    scenario 'they see the homepage' do
      visit '/'
      expect(page).to have_css("img[alt='Beyond camping']")
    end

    scenario 'they can see the full list of campsites' do
      visit '/'
      expect(page).to have_link 'ABC Camping'
    end
  end

  context 'when user wants details on a campsite' do

    scenario 'user can click on campsite link to see full information' do
      visit '/'
      click_link 'ABC Camping'
      expect(page).to have_content 'ABC Camping'
      expect(current_path).to eq "/sites/#{abc.id}"
    end

    scenario 'user is able to return to the listings page' do
      visit '/'
      click_link 'ABC Camping'
      click_button 'Back'
      expect(current_path).to eq '/sites'
      expect(page).to have_css("img[alt='Beyond camping']")
    end
  end

  context 'when user conducts a search on town' do

    scenario 'user can search for campsites by town' do
      pending
      visit '/'
      fill_in('search', with: 'Glastonbury')
      click_button('search-button')
      expect(page).to have_content('ABC Camping')
      expect(page).not_to have_content('XYZ Camping')
    end

    scenario 'user can search for campsites by county' do
      pending
      visit '/'
      fill_in('search', with: 'Kent')
      click_button('search-button')
      expect(page).to have_content('GHI Camping')
      expect(page).not_to have_content('ABC Camping')
      expect(page).not_to have_content('DEF Camping')
      expect(page).not_to have_content('XYZ Camping')
    end

    scenario 'user can search for campsites by postcode' do
      pending
      visit '/'
      fill_in('search', with: 'BA4 6TA')
      page.execute_script("$('#show-filters').toggle()")
      click_button('search-button')
      expect(page).to have_content('ABC Camping')
      expect(page).to have_content('DEF Camping')
      expect(page).to have_content('XYZ Camping')
      expect(page).not_to have_content('GHI Camping')
    end

    scenario 'user can search by town and filter results based on whether they are in a forest location' do
      pending
      visit '/'
      fill_in('search', with: 'Glastonbury')
      check('forest')
      click_button('search-button')
      expect(page).to have_content('ABC Camping')
      expect(page).to have_content('GHI Camping')
      expect(page).not_to have_content('DEF Camping')
      expect(page).not_to have_content('XYZ Camping')
    end

    scenario 'user can search by town and filter results based on whether they are in a forest AND lake location' do
      pending
      visit '/'
      fill_in('search', with: 'Glastonbury')
      check('forest')
      check('lake')
      click_button('search-button')
      expect(page).to have_content('GHI Camping')
      expect(page).not_to have_content('ABC Camping')
      expect(page).not_to have_content('DEF Camping')
      expect(page).not_to have_content('XYZ Camping')
    end

  end

end
