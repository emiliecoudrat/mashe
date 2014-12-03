class Information < ActiveRecord::Base
  belongs_to :camp
  belongs_to :parent
  CATEGORIES = ['message', 'horaires', 'agenda', 'actualités', 'cantine', 'devoirs', 'programme annuel']
  validates_presence_of :name, :content, :camp

  acts_as_taggable_on :categories
end
