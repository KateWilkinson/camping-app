require 'spec_helper'

describe Vendor, type: :model do
  it { is_expected.to have_many :sites }
end