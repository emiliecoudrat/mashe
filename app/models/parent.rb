class Parent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :parentships
  has_many :kids, through: :parentships
  has_many :adverts
  has_many :informations
  has_many :events  # Note: events that this parent created
  has_many :attending_events, class_name: "Event", through: :guests #Note : events pour lesquels il est attendus

  validates_presence_of :title, :last_name, :first_name, :phone_number, :email, :password

  def display_name
    "#{title} #{first_name} #{last_name}"
  end
end
