class Scholarship < ActiveRecord::Base
  belongs_to :camp
  belongs_to :kid

  validates_uniqueness_of :kid_id, :scope => [:camp_id]
end
