class Event < ActiveRecord::Base
  belongs_to :parent
  belongs_to :school
  has_many :guests
  accepts_nested_attributes_for :guests, :reject_if => :all_blank, :allow_destroy => true
end
