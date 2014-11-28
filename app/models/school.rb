class School < ActiveRecord::Base

  has_many :levels, dependent: :destroy
  has_many :camps, through: :levels
  has_many :adverts

  validates_presence_of :name, :address, :city, :zipcode, :country

  include AlgoliaSearch
  algoliasearch do
    attributesToIndex ['address', 'name', 'city']
    # associated index settings can be configured from here
  end

end
