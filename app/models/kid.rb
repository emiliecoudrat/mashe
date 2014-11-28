class Kid < ActiveRecord::Base
  GENDERS = [ 'm', 'f' ]
  belongs_to :scholarship
  has_many :parentships
  has_many :parents, through: :parentships

  validates_presence_of :first_name, :last_name, :birthdate, :gender
  validates_inclusion_of :gender, in: GENDERS
end
