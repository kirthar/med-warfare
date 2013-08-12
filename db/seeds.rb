User.destroy_all
Unit.destroy_all

User.create(email: 'chris@itnig.net', password: '12345678')

Archer.create(name: 'Legolas', description: 'Ultra awesome elf. Also very gayer.')
Knight.create(name: 'Jaime Lanister', description: 'Westeros\'s Robert Downey Jr.')
Priest.create(name: 'Jisus Craist', description: 'The fucking son of God Christian Edition.')
Rogue.create(name: 'Arsen Lupin III', description: 'Gentelman to the death.')
Mage.create(name: 'Rincewind', description: 'Poor, coward and useless.')

Archer.create(name: 'Robin Scherbatsky', description: 'Ted Mosby\'s ex girlfriend. Isn\'t Robin Hood\'s family')
Knight.create(name: 'Conan', description: 'Where\'s my horse? My horse is amazing')
Priest.create(name: 'Mahoma', description: 'The fucking mesias of God Muslim Edition.')
Rogue.create(name: 'Luis Barcenas', description: 'Never accept an envelop from him.')
Mage.create(name: 'Voldemort', description: 'Evil noseless.')
