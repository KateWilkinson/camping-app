class Site < ActiveRecord::Base
  belongs_to :vendor
  validates :name, uniqueness: true
end
