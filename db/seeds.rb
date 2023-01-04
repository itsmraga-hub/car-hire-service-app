# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

['admin', 'user'].each do |role|
  Role.find_or_create_by({name: role})
end

cars = Car.create([
  { image: 'https://', name: 'Mercedes W12', description: 'Won the 2021 world championship' },
  { image: 'https://', name: 'Mercedes W11', description: 'Won the 2020 world championship' },
  { image: 'https://', name: 'Mercedes W10', description: 'Won the 2019 world championship' },
])

users = User.create([
  { username: 'raga', role: Role.find_by_name('admin') },
  { username: 'conor', role: Role.find_by_name('user')  },
  { username: 'david', role: Role.find_by_name('admin')  },
])

reservations = Reservation.create([
  { user: users[0], car: cars[0] },
  { user: users[1], car: cars[0] },
  { user: users[2], car: cars[0] },
  { user: users[1], car: cars[1] },
  { user: users[2], car: cars[2] },
  { user: users[2], car: cars[1] },
])
