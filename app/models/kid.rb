class Kid < ActiveRecord::Base
  has_many :parentships
  has_many :parents, through: :parentships
end
