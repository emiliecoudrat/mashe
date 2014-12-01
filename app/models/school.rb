class School < ActiveRecord::Base

  has_many :levels, dependent: :destroy
  has_many :camps, through: :levels
  has_many :adverts
  has_many :events
  has_many :guests, through: :events

  validates_presence_of :name, :address, :city, :zipcode, :country

  include AlgoliaSearch

  algoliasearch index_name: "#{self}#{ENV['ALGOLIA_SUFFIX']}", if: :validated? do
    attribute :address, :name, :city
  end

  def validated?
    raise "Put an ALGOLIA_SUFFIX in your config/application.yml" if Rails.env.development? && ENV['ALGOLIA_SUFFIX'].blank?
    self.validation == true
  end

end
