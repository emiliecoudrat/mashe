class Camp < ActiveRecord::Base
  belongs_to :level
  belongs_to :school
end
