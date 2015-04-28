# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make other Players
%w(Gandalf Legolas Frodo Gollum Bilbo Smaug Saruman Boromir Aragorn).each do |name|
  Player.create name: name, email: name+"@railstory.com", password: 'password'
end

# Make Character
%w(Knight Warrior Archer Magician Samurai King Queen Fairy Orc Elf Mage Bandit Swordsman Demon Explorer Phantom Pirate).each do |name|
  Character.create name: name, level: 1, health: 100, experience: rand(10...31), strength: rand(10...31), magic: rand(10...31), player_id: rand(1...10)
end

# Make Beasts
%w(Dragon).each do |name|
  Beast.create name: name, element: 'Fire', style: ['Light', 'Dark'].sample, counters: rand(1...16), character_id: rand(1...18)
end

%w(Octopus).each do |name|
  Beast.create name: name, element: 'Water', style: ['Light', 'Dark'].sample, counters: rand(1...16), character_id: rand(1...18)
end

%w(Unicorn).each do |name|
  Beast.create name: name, element: 'Wind', style: ['Light', 'Dark'].sample, counters: rand(1...16), character_id: rand(1...18)
end

%w(Bear).each do |name|
  Beast.create name: name, element: 'Earth', style: ['Light', 'Dark'].sample, counters: rand(1...16), character_id: rand(1...18)
end
