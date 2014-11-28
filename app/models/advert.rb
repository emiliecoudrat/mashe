class Advert < ActiveRecord::Base
  belongs_to :parent
  belongs_to :school
  monetize :price_cents

  validates_presence_of :parent, :school, :price_cents
end
