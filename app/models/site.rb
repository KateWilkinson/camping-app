class Site < ActiveRecord::Base
  belongs_to :vendor
  has_many :requests
  validates :name, uniqueness: true
  has_attached_file :image,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
                      },
                    },
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

  has_attached_file :image_2,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
                      },
                    },
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

  has_attached_file :image_3,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
                      },
                    },
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

  has_attached_file :image_4,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
                      },
                    },
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

  has_attached_file :image_5,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
                      },
                    },
                    :default_url => "",
                    :url => "/system/sites/images/:id/:style/:filename",
                    :path => "#{Rails.root}/public/system/:class/images/:id/:style/:basename.:extension",
                    :storage => :filesystem

  has_attached_file :image_6,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
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

end
