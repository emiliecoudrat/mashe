class Advert < ActiveRecord::Base
  CATEGORYS = [ 'classe', 'jeux', 'fête', 'garde', 'bébé', 'urgence', 'anglais', 'maison', 'zen', 'bons_plans']
  TRANSACTIONS = [ 'je vends', 'je prête', 'je donne']
  belongs_to :parent
  belongs_to :school
  has_many :camps, through: :schools
  monetize :price_cents

  validates_presence_of :parent, :school, :price_cents, :title, :category, :transaction, :description, :parent_id, :school_id
  validates_inclusion_of :category, in: CATEGORYS
  validates_inclusion_of :transaction, in: TRANSACTIONS

  def display_name
    "#{advert.title} - #{advert.category} - #{advert.transaction} - #{school.name}"
  end
end

