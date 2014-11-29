class Event < ActiveRecord::Base
  belongs_to :parent
  has_many :guests
end
