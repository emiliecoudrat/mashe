class School < ActiveRecord::Base
  has_many :levels
  has_many :camps, trough: :levels

  validates_presence_of :name, :address, :city, :zipcode, :country
end
