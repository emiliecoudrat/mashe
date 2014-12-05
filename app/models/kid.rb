class Kid < ActiveRecord::Base
  GENDERS = [ 'm', 'f' ]
  has_many :scholarships
  has_many :parentships
  has_many :parents, through: :parentships
  has_many :camps, through: :scholarships
  has_many :schools, through: :camps

  validates_presence_of :first_name, :last_name, :birthdate, :gender
  validates_inclusion_of :gender, in: GENDERS

  accepts_nested_attributes_for :scholarships

  def current_camp
    camps.order('year DESC').first
  end

  def is_birthday?
    birthdate.month == Time.now.month && birthdate.day == Time.now.day
  end

end
