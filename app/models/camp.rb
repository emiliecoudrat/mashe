class Camp < ActiveRecord::Base
  belongs_to :level
  belongs_to :school
  has_many :scholarships

  validates_presence_of :name, :confidential_code, :level_id, :school_id

  def display_name
    "#{school.name} - #{level.name} - #{name} - #{year}"
  end
end