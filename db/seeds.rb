# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make other Players
%w(Gandalf Legolas Frodo Gollum Bilbo Smaug Saruman).each do |name|
  Player.create name: name, email: name+"@railstory.com", password: 'password'
end

# Make Character
%w(Knight Warrior Archer Magician Samurai King Queen Fairy Orc Elf Mage Bandit Swordsman).each do |name|
  Character.create name: name, level: 1, health: 100, experience: rand(10...30), strength: rand(10...30), magic: rand(10...30), player_id: rand(1...7)
end

#Make Beast
%w((Dragon, fire) (Octopus, water) (Unicorn, wind) (Bear, earth)).each do |name, type|
	Beast.create name: name, type: type, style: ['light', 'dark'].sample, counters: rand(1...15)
end
