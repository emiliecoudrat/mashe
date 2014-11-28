class Parentship < ActiveRecord::Base
  STATUSES = [ 'father', 'mother', 'other' ]

  belongs_to :kid
  belongs_to :parent

  validates_presence_of :parent_id, :kid_id, :status
  validates_inclusion_of :status, in: STATUSES
end
