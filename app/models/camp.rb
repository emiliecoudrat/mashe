class Camp < ActiveRecord::Base
  belongs_to :level
  belongs_to :school
  belongs_to :notebook
end
