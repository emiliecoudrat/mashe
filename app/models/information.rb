class Information < ActiveRecord::Base
  belongs_to :camp
  belongs_to :parent

  validates_presence_of :name, :content, :categorie, :parent, :camp
end
