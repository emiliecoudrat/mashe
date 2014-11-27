class Scholarship < ActiveRecord::Base
  belongs_to :camp
  belongs_to :kid
end
