class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :parentships
  has_many :kids, through: :parentships
  has_many :adverts
  # has_many :informations
  has_many :events  # Note: events that this parent created
  has_many :guests

  validates_presence_of :last_name, :first_name, :email, :password

  def display_name
    "#{title} #{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_with_kids_name
    #TODO: add children names
    # children = self.kids.map {|x| x.first_name}.join(", ")
    "#{first_name} #{last_name}"
  end
end
