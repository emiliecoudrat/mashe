class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :parentships
  has_many :kids, through: :parentships
  has_many :adverts

  validates_presence_of :title, :last_name, :first_name, :phone_number, :email, :password

  def display_name
    "#{title} #{first_name} #{last_name}"
  end
end
