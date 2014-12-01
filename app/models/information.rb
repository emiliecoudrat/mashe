class Information < ActiveRecord::Base
  belongs_to :camp
  belongs_to :parent
end
