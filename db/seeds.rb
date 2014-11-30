require "faker"

# Faker creations
PARENTS = 100
SCHOOLS = 1
# 8 levels
CAMPS_PER_LEVEL = 2
KIDS_PER_CAMP = 20
ADVERTS_PER_PARENT = 5

# Destroy old seeds when new faker seeds
School.destroy_all
Parent.destroy_all
Kid.destroy_all

# Create admin profil
parent = Parent.new(email: 'admin@shareecole.com', password: 'shareecole', title: "M", first_name: 'Admin', last_name: 'Admin', phone_number: Faker::PhoneNumber.phone_number)
parent.admin = true
parent.save!

# Create 100 parents
parents = []
PARENTS.times do |i|
  parent = Parent.create ({
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

# Create 1 school
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

    # Create 8 levels
    %w(PS MS GS CP CE1 CE2 CM1 CM2).each_with_index do |level_name, j|
      level = school.levels.create(name: level_name)
      puts "[LEVEL #{j}] #{level_name}"

      # Create 3 scholarships
      [2012, 2013, 2014].each do |year|
        puts "[YEAR #{year}] #{year}"

      # Create 2 camps / level
      CAMPS_PER_LEVEL.times do |k|
        camp = level.camps.create({
          name: Faker::Commerce.color.capitalize,
          confidential_code:Faker::Code.ean,
          level: level,
          school: school,
          year: year
        })
        puts "[CAMP #{k}] #{camp.name}"

        # Create 20 kids / camp
        KIDS_PER_CAMP.times do |l|
          kid = Kid.create! ({
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            birthdate: Faker::Date.backward(14),
            gender: Kid::GENDERS.sample
          })
          puts "[KID #{l}] #{kid.first_name} #{kid.last_name}"

          parents = []
          parents.each do |parent|
          if (0..5).to_a.sample <= 3
            school.adverts.create!(parent: parent, title: Faker::Commerce.product_name, description: Faker::Lorem.sentences, categorie: 'jeux' ,
            price_cents: Faker::Commerce.price, transaction_type: 'je vends')
          end
          if (0..5).to_a.sample <= 1
            school.adverts.create!(parent: parent, title: Faker::Commerce.product_name, description: Faker::Lorem.sentences, categorie: 'fête' ,
            price_cents: Faker::Commerce.price, transaction_type: 'je prête')
          end
          if (0..5).to_a.sample <= 1
            school.adverts.create!(parent: parent, title: Faker::Commerce.product_name, description: Faker::Lorem.sentences, categorie: 'garde' ,
            price_cents: Faker::Commerce.price, transaction_type: 'je donne')
          end

          if (0...100).to_a.sample <= 80
            mother = parents.sample
            mother.parentships.create(kid: kid, status: 'mother')
          end
          if (0...100).to_a.sample <= 60
            father = parents.sample
            father.parentships.create(kid: kid, status: 'father')
          end
          if (0...100).to_a.sample <= 30
            other = parents.sample
            other.parentships.create(kid: kid, status: 'other')
          end
          camp.scholarships.create(kid: kid)
          end

        end
      end
    end
  end
end
