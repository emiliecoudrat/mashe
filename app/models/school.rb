class School < ActiveRecord::Base
  has_many :levels, dependent: :destroy
  has_many :camps, through: :levels

  validates_presence_of :name, :address, :city, :zipcode, :country
end
