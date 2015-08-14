require 'spec_helper'

describe Site, type: :model do
  it { is_expected.to belong_to :vendor }

  it 'is not valid unless it has a unique name' do
    Site.create(name: 'ABC Camping', town: 'Ashford', address: '55 Street', postcode: 'TN25 7DS', price: 50, description: 'blah')
    site = Site.new(name: 'ABC Camping', town: 'Ashford', address: '55 Street', postcode: 'TN25 7DS', price: 50, description: 'blah')
    expect(site).to have(1).error_on(:name)
  end
end


