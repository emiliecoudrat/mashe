class Kid < ActiveRecord::Base
  GENDERS = [ 'm', 'f' ]
  belongs_to :scholarship
  has_many :parentships
  has_many :parents, through: :parentships

  validates_presence_of :firstname, :lastname, :birthdate, :gender
  validates_inclusion_of :gender, in: GENDERS
end
