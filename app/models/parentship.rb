class Parentship < ActiveRecord::Base
  belongs_to :kids
  belongs_to :Parents

  validates_presence_of :parent_id, :kid_id
end
