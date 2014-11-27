# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

# Create 2000 parents
parents = []
2000.times do
  parents << Parent.create  # TODO
end

# Create schools
10.times do
  school = School.create(name: "Ecole #{Faker::Name.name}")

  # Create levels
  %w(CE1 CE2 CM1 CM2).each do |level_name|
    level = school.levels.create(name: level_name)

    # 3 school years
    [2012, 2013, 2014].each do |scholarship|

      # 5 classes per level
      5.times do
        camp = school.camps.create(level: level, name: "#{level_name} #{Faker::Commerce.color.capitalize}")

        # Create 20 kids
        20.times do
          kid = Kid.create  # TODO
          first_parent = parents.sample
          second_parent = parents.sample
          first_parent.parentships.create(kid: kid)
          second_parent.parentships.create(kid: kid)

          camp.kid_camps.create(kid: kid, scholarship: scholarship)
        end
      end
    end
  end
end