class Camp < ActiveRecord::Base
  belongs_to :level
  belongs_to :school
  has_many :scholarships
  has_many :kids, through: :scholarships

  before_validation :set_year
  before_validation :generate_confidential_code

  validates_presence_of :name, :confidential_code, :level, :school, :year
  validates_uniqueness_of :confidential_code

  def display_name
    "#{school.name} - #{level.name} - #{name} - #{year}"
  end

  def generate_confidential_code
    return unless self.confidential_code.blank?
    self.confidential_code = loop do
      random_code = (0...4).map { (65 + rand(26)).chr }.join
      break random_code unless Camp.exists?(confidential_code: random_code)
    end
  end

  def set_year
    if Time.now.month >= 7  # July to December
      self.year = Time.now.year
    else                    # January to June
      self.year = Time.now.year - 1
    end
  end
end