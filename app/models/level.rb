class Level < ActiveRecord::Base
  belongs_to :school

  validates_presence_of :school, :name
end
