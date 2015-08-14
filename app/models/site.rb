class Site < ActiveRecord::Base
  belongs_to :vendor
  has_many :requests
  validates :name, uniqueness: true
end
