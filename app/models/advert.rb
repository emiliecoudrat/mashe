class Advert < ActiveRecord::Base
  CATEGORIES = [ 'classe', 'jeux', 'fête', 'garde', 'bébé', 'urgence', 'anglais', 'maison', 'zen', 'bons_plans']
  TRANSACTION_TYPES = [ 'je vends', 'je prête', 'je donne', 'je propose']
  belongs_to :parent
  belongs_to :school
  has_many :camps, through: :schools
  monetize :price_cents

  validates_presence_of :title, :description, :categorie, :transaction_type, :price_cents, :school
  validates_inclusion_of :categorie, in: CATEGORIES
  validates_inclusion_of :transaction_type, in: TRANSACTION_TYPES



  def display_name
    "#{self.title} - #{self.categorie} - #{self.transaction_type} - #{self.school.name}"
  end
end

