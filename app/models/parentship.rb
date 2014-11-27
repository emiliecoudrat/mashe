class Parentship < ActiveRecord::Base
  belongs_to :kid
  belongs_to :parent

  validates_presence_of :parent_id, :kid_id
end
