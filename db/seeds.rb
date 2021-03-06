User.destroy_all
Unit.destroy_all

admin = User.create(username: 'Admin',         email: 'admin@itnig.net', password: 'iamadmin', admin: true)
user1 = User.create(username: 'Kirthar',       email: 'chris+mw+test+1@itnig.net', password: '12345678')
user2 = User.create(username: 'Gandark',       email: 'chris+mw+test+2@itnig.net', password: '12345678')
user3 = User.create(username: 'Pijus Maximus', email: 'chris+mw+test+3@itnig.net', password: '12345678')
user4 = User.create(username: 'Dummie',        email: 'chris+mw+test+4@itnig.net', password: '12345678')

unit = Units::Archer.create(name: 'Legolas', description: 'Ultra awesome elf. Also very gayer.', user: user1)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/archer_man.jpg").to_s) )
unit = Units::Knight.create(name: 'Jaime Lanister', description: 'Westeros\'s Robert Downey Jr.', user: user1)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/knight_woman.jpg").to_s) )
unit = Units::Priest.create(name: 'Jisus Craist', description: 'The fucking son of God Christian Edition.', user: user1)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/priest_man.jpg").to_s) )
unit = Units::Rogue.create(name: 'Arsen Lupin III', description: 'Gentelman to the death.', user: user1)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/rogue_woman.jpg").to_s) )
unit = Units::Mage.create(name: 'Rincewind', description: 'Poor, coward and useless.', user: user1)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/merlin.jpg").to_s) )

unit = Units::Archer.create(name: 'Robin Scherbatsky', description: 'Ted Mosby\'s ex girlfriend. Isn\'t Robin Hood\'s family', user: user2)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/archer_woman.jpg").to_s) )
unit = Units::Knight.create(name: 'Conan', description: 'Where\'s my horse? My horse is amazing', user: user2)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/knight_man.jpg").to_s) )
unit = Units::Priest.create(name: 'Mahoma', description: 'The fucking mesias of God Muslim Edition.', user: user2)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/dark_priestess.jpg").to_s) )
unit = Units::Rogue.create(name: 'Luis Barcenas', description: 'Never accept an envelop from him.', user: user2)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/rogue_man.jpg").to_s) )
unit = Units::Mage.create(name: 'Voldemort', description: 'Evil noseless.', user: user2)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/witch_queen.jpg").to_s) )

unit = Units::Archer.create(name: 'Legolas', description: 'Ultra awesome elf. Also very gayer.', user: user3)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/archer_man.jpg").to_s) )
unit = Units::Knight.create(name: 'Jaime Lanister', description: 'Westeros\'s Robert Downey Jr.', user: user3)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/knight_woman.jpg").to_s) )
unit = Units::Priest.create(name: 'Jisus Craist', description: 'The fucking son of God Christian Edition.', user: user3)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/priest_man.jpg").to_s) )
unit = Units::Rogue.create(name: 'Arsen Lupin III', description: 'Gentelman to the death.', user: user3)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/rogue_woman.jpg").to_s) )
unit = Units::Mage.create(name: 'Rincewind', description: 'Poor, coward and useless.', user: user3)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/merlin.jpg").to_s) )

unit = Units::Archer.create(name: 'Robin Scherbatsky', description: 'Ted Mosby\'s ex girlfriend. Isn\'t Robin Hood\'s family', user: user4)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/archer_woman.jpg").to_s) )
unit = Units::Knight.create(name: 'Conan', description: 'Where\'s my horse? My horse is amazing', user: user4)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/knight_man.jpg").to_s) )
unit = Units::Priest.create(name: 'Mahoma', description: 'The fucking mesias of God Muslim Edition.', user: user4)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/dark_priestess.jpg").to_s) )
unit = Units::Rogue.create(name: 'Luis Barcenas', description: 'Never accept an envelop from him.', user: user4)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/rogue_man.jpg").to_s) )
unit = Units::Mage.create(name: 'Voldemort', description: 'Evil noseless.', user: user4)
UnitImage.create(unit: unit, image: File.open(Rails.root.join("db/seed_data/unit_images/witch_queen.jpg").to_s) )

