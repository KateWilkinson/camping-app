require 'spec_helper'

describe Site, type: :model do
  it { is_expected.to belong_to :vendor }

  it { is_expected.to have_many :requests }

  it { is_expected.to have_many(:requests).dependent(:destroy) }

  it 'a site can not be added with a summary longer than 10 words' do
    site = Site.new(summary: 'Ever since I can remember I always wanted to be a gangster. To me that was better than being president of the United States. To be a gangster was to own the world.')
    expect(site).to have(1).error_on(:summary)
    expect(site).not_to be_valid
  end

  describe 'search' do

    let!(:site1) { Site.create(name: 'First site', town: 'Glastonbury') }
    let!(:site2) { Site.create(name: 'Second site', town: 'Canterbury') }

    xit 'searches database and returns campsites that match search criteria' do
      sites = Site.all
      site = sites.search('Glastonbury')
      expect(site).to eq(:site1)
    end

  end

end
