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
end
