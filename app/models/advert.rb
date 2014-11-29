class Advert < ActiveRecord::Base
  CATEGORYS = [ 'classe', 'jeux', 'fête', 'garde', 'bébé', 'urgence', 'anglais', 'maison', 'zen', 'bons_plans']
  TRANSACS = [ 'je vends', 'je prête', 'je donne']
  belongs_to :parent
  belongs_to :school
  has_many :camps, through: :schools
  monetize :price_cents

  validates_presence_of :title, :description, :category, :transac, :price_cents, :parent_id, :school_id
  validates_inclusion_of :category, in: CATEGORYS
  validates_inclusion_of :transac, in: TRANSACS

  def display_name
    "#{advert.title} - #{advert.category} - #{advert.transac} - #{school.name}"
  end
end

