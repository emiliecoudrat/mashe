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


# Create 5 annonces / parent
adverts = []
ADVERTS_PER_PARENT.times do |a|
  advert = Advert.create ({
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentences,
    price_cents: Faker::Commerce.price,
    parent: parent,
  })
  adverts << advert
  puts "[ADVERT #{a}] Creating advert #{advert.title}"
end
    # Specificities for category and types of transaction :
    # Be careful, in the Advert table, the name of the column is transac because transaction is a key_word in ActiveAdmin.
    if (0...5).to_a.sample <= 3
      sale = advert.sample.create(advert: advert, transac: 'je vends')
    end
    if (0...5).to_a.sample <= 1
      loan = adverts.sample.create(advert: advert, transac: 'je prête')
    end
    if (0...5).to_a.sample <= 1
      gift = adverts.sample.create(advert: advert, transac: 'je donne')
    end
    if (0...5).to_a.sample <= 2
      game = adverts.sample.create(advert: advert, category: 'jeux')
    end
    if (0...5).to_a.sample <= 2
      party = adverts.sample.create(advert: advert, category: 'fête')
    end
    if (0...5).to_a.sample <= 2
      marryp = adverts.sample.create(advert: advert, category: 'garde')
    end
    if (0...5).to_a.sample <= 1
      classroom = adverts.sample.create(advert: advert, category: 'classe')
    end
    if (0...5).to_a.sample <= 1
      english = adverts.sample.create(advert: advert, category: 'anglais')
    end
    if (0...5).to_a.sample <= 3
      home = adverts.sample.create(advert: advert, category: 'maison')
    if (0...5).to_a.sample <= 2
      baby = adverts.sample.create(advert: advert, category: 'bébé')
    end
    if (0...5).to_a.sample <= 1
      emergency = adverts.sample.create(advert: advert, category: 'help')
    end
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


    [2012, 2013, 2014].each do |year|

      puts "[YEAR #{year}] #{year}"

      CAMPS_PER_LEVEL.times do |k|

        camp = level.camps.create({
          name: Faker::Commerce.color.capitalize,
          confidential_code:Faker::Code.ean,
          level: level,
          school: school,
          year: year
        })

        puts "[CAMP #{k}] #{camp.name}"

        KIDS_PER_CAMP.times do |l|
          kid = Kid.create! ({
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            birthdate: Faker::Date.backward(14),
            gender: Kid::GENDERS.sample
          })

          puts "[KID #{l}] #{kid.first_name} #{kid.last_name}"

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
