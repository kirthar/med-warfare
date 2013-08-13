User.destroy_all
Unit.destroy_all

user1 = User.create(email: 'chris+1@itnig.net', password: '12345678')
user2 = User.create(email: 'chris+2@itnig.net', password: '12345678')

Archer.create(name: 'Legolas', description: 'Ultra awesome elf. Also very gayer.', user: user1)
Knight.create(name: 'Jaime Lanister', description: 'Westeros\'s Robert Downey Jr.', user: user1)
Priest.create(name: 'Jisus Craist', description: 'The fucking son of God Christian Edition.', user: user1)
Rogue.create(name: 'Arsen Lupin III', description: 'Gentelman to the death.', user: user1)
Mage.create(name: 'Rincewind', description: 'Poor, coward and useless.', user: user1)

Archer.create(name: 'Robin Scherbatsky', description: 'Ted Mosby\'s ex girlfriend. Isn\'t Robin Hood\'s family', user: user2)
Knight.create(name: 'Conan', description: 'Where\'s my horse? My horse is amazing', user: user2)
Priest.create(name: 'Mahoma', description: 'The fucking mesias of God Muslim Edition.', user: user2)
Rogue.create(name: 'Luis Barcenas', description: 'Never accept an envelop from him.', user: user2)
Mage.create(name: 'Voldemort', description: 'Evil noseless.', user: user2)
