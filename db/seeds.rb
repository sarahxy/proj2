# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make Character
%w(Knight Warrior Archer Magician Samurai).each do |name|
  Character.create name: name, level: rand(1..10), health: 100, experience: 10, strength: 10, magic: 10
end

# Make other Players
%w(Gandalf Legolas Frodo Gollum).each do |name|
  Player.create name: name, email: name+"@railstory.com", password: 'password'
end
