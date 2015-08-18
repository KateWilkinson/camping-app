class Site < ActiveRecord::Base
  belongs_to :vendor
  has_many :requests
  validates :name, uniqueness: true
  # validates :town, presence: true
  # validates :county, presence: true
  # validates :postcode, presence: true

  has_attached_file :image,
                    :styles => {
                      :large => {
                        :geometry => '1000x1000#',
                        :format => 'jpg',
                        :quality => 95,
                      },
                      :medium => {
                        :geometry => '400x400#',
                        :format => 'jpg',
                        :quality => 75,
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                      },
                    },
                    :default_url => ""

  has_attached_file :image_2,
                      :styles => {
                        :large => {
                          :geometry => '1000x1000#',
                          :format => 'jpg',
                          :quality => 95,
                        },
                        :medium => {
                          :geometry => '400x400#',
                          :format => 'jpg',
                          :quality => 75,
                        },
                        :thumb => {
                          :geometry => '100x100#',
                          :format => 'jpg',
                          :quality => 40,
                        },
                      },
                    :default_url => ""

  has_attached_file :image_3,
                      :styles => {
                        :large => {
                          :geometry => '1000x1000#',
                          :format => 'jpg',
                          :quality => 95,
                        },
                        :medium => {
                          :geometry => '400x400#',
                          :format => 'jpg',
                          :quality => 75,
                        },
                        :thumb => {
                          :geometry => '100x100#',
                          :format => 'jpg',
                          :quality => 40,
                        },
                      },
                    :default_url => ""

  has_attached_file :image_4,
                      :styles => {
                        :large => {
                          :geometry => '1000x1000#',
                          :format => 'jpg',
                          :quality => 95,
                        },
                        :medium => {
                          :geometry => '400x400#',
                          :format => 'jpg',
                          :quality => 75,
                        },
                        :thumb => {
                          :geometry => '100x100#',
                          :format => 'jpg',
                          :quality => 40,
                        },
                      },
                    :default_url => ""

  has_attached_file :image_5,
                      :styles => {
                        :large => {
                          :geometry => '1000x1000#',
                          :format => 'jpg',
                          :quality => 95,
                        },
                        :medium => {
                          :geometry => '400x400#',
                          :format => 'jpg',
                          :quality => 75,
                        },
                        :thumb => {
                          :geometry => '100x100#',
                          :format => 'jpg',
                          :quality => 40,
                        },
                      },
                    :default_url => ""

  has_attached_file :image_6,
                      :styles => {
                        :large => {
                          :geometry => '1000x1000#',
                          :format => 'jpg',
                          :quality => 95,
                        },
                        :medium => {
                          :geometry => '400x400#',
                          :format => 'jpg',
                          :quality => 75,
                        },
                        :thumb => {
                          :geometry => '100x100#',
                          :format => 'jpg',
                          :quality => 40,
                        },
                      },
                    :default_url => ""
                    # :url => "/system/sites/images/:id/:style/:filename",
                    # :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    # :storage => :filesystem

  validates_attachment_content_type :image,
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :image_2,
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :image_3,
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :image_4,
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :image_5,
                                    :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :image_6,
                                    :content_type => /\Aimage\/.*\Z/

  def self.search(query)
    where("town like ? OR county like ? OR postcode like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.amenities
    [:toilet_block, :ensuite_toilet, :shower_block, :ensuite_shower, :'on-site_restaurant', :'on-site_shop', :cooking_facilities, :charging_facilities, :'on-site parking', :wifi_available, :handicap_accessible, :towels_provided, :laundry_facilities]
  end

  def self.policies
    [:family_friendly, :no_children, :pets_welcome, :eco_friendly, :campfires_allowed, :barbecues_allowed ]
  end

  def self.locationtype
    [:forest, :lake, :mountain, :peaceful, :remote_location, :scenic, :good_for_hiking, :wildlife_haven ]
  end

  def self.leisure
    [:canoeing_nearby, :climbing_nearby, :beach_nearby, :cycle_hire_nearby, :horse_riding_nearby, :sailing_nearby, :watersports_nearby, :pub_or_restaurant_nearby]
  end

end
