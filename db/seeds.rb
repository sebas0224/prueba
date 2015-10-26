# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user=User.create(name: "juan", email: "test@gmail.com", password: "123456789", phone:"234567895677", status:"activo")

5.times do |i|
	product=Product.create(name: "BLUSA#{i}", description: "kdsfgus", user: user)
end