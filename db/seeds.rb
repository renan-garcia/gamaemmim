# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Lead.all.each do |lead|
  full_name = lead.name.split(" ")
  if(full_name.size <= 1)
    lead.name = lead.name + " " + Faker::Name.last_name
    lead.save
  end
end
