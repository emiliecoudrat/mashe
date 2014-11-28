require "faker"

PARENTS = 100
SCHOOLS = 1
CAMPS_PER_LEVEL = 5
KIDS_PER_CAMP = 20

School.destroy_all
Parent.destroy_all
Kid.destroy_all

parent = Parent.new(email: 'admin@shareecole.com', password: 'shareecole', title: "M", first_name: 'Admin', last_name: 'Admin', phone_number: Faker::PhoneNumber.phone_number)
parent.admin = true
parent.save!

# Create 2000 parents
parents = []
PARENTS.times do |i|
  parent = Parent.create! ({
    title: Faker::Name.prefix,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.free_email,
    password: Faker::Code.ean,
  })
  parents << parent
  puts "[PARENT #{i}] Creating parent #{parent.first_name} #{parent.last_name}"
end

# Create 10 schools
schools = []
SCHOOLS.times do |i|
  school = School.create({
    name: "Ecole #{Faker::Name.name}",
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country:Faker::Address.country,
  })
  puts "[SCHOOL #{i}] #{school.name}"

  # Create levels
  %w(PS MS GS CP CE1 CE2 CM1 CM2).each_with_index do |level_name, j|
    level = school.levels.create(name: level_name)

    puts "[LEVEL #{j}] #{level_name}"

    # Create 5 classes per level
    camps = []
    CAMPS_PER_LEVEL.times do |k|
      camp = level.camps.create({
        name: Faker::Commerce.color.capitalize,
        confidential_code:Faker::Code.ean,
        level: level,
        school: school,
      })

      puts "[CAMP #{k}] #{camp.name}"

      [2012, 2013, 2014].each do |year|

        puts "[YEAR #{year}] #{year}"

        # Create 20 kids
        kids = []
        KIDS_PER_CAMP.times do |l|
          kid = Kid.create! ({
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            birthdate: Faker::Date.backward(14),
            gender: Kid::GENDERS.sample
          })

          puts "[KID #{l}] #{kid.first_name} #{kid.last_name}"

          first_parent = parents.sample
          second_parent = parents.sample
          other_parent = parents.sample
          first_parent.parentships.create(kid: kid)
          second_parent.parentships.create(kid: kid)
          other_parent.parentships.create(kid: kid)
          camp.scholarships.create(kid: kid, year: year)
        end
      end
    end
  end
end
