class Request < ActiveRecord::Base
    belongs_to :site

    validates :customer_name, length: {minimum: 3}
end
