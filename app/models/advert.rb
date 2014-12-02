class Advert < ActiveRecord::Base
  # 'classe', 'jeux', 'fête', 'garde', 'bébé', 'urgence', 'anglais', 'maison', 'zen', 'bons_plans'
  CATEGORIES = [ 'classroom', 'game' ]
  TRANSACTION_TYPES = [ 'sell', 'lend', 'give', 'recommend' ]
  belongs_to :parent
  belongs_to :school
  has_many :camps, through: :schools
  monetize :price_cents

  acts_as_taggable_on :categories

  validates_presence_of :title, :description, :transaction_type, :price_cents, :school
  validates_inclusion_of :transaction_type, in: TRANSACTION_TYPES

  def display_name
    "#{self.title} - #{self.transaction_type} - #{self.school.name}"
  end
end

