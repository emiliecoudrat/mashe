class Level < ActiveRecord::Base
  belongs_to :school
  has_many :camp

  validates_presence_of :name, :school_id
end
