# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
puts "scientific" + "   " + "english" + "   " + "arabic" + "   " + "texture" + "   " + "flavor"
CSV.foreach('fish.csv') do |row|
  puts row [2]
  scientific = row[0]
  scientific ||= ""
  english = row[1]
  english ||= ""
  arabic = row[2]
  arabic ||= ""
  texture = row[3]
  texture ||= ""
  flavor = row[4]
  flavor ||= ""
  Fish.create(scientific: scientific, english: english, lebanese: arabic, texture: texture, flavor: flavor).save!
end
puts "done"
