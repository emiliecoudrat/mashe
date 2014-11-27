class Level < ActiveRecord::Base
  belongs_to :school
  has_many :camps, dependent: :destroy

  validates_presence_of :name, :school_id
end
