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
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

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
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

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
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

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
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

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
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

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
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

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


end
