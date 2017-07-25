# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
		email =Faker::Internet.email
	User.create(
		user_name: Faker::Name.name,
		email: email,
		password: '12345678',
		name: Faker::Name.name,
		provider: 'email',
		birthday: Faker::Date.birthday(18, 65),
		gender: rand(0..4),
		uid: email
		) 
end
20.times do 
	Book.create(
		author: Faker::Book.author,
		title: Faker::Book.title,
		name: Faker::Book.title,
		isn: Faker::Number.number(10)
		)
end

10.times do
	Cart.create(user: User.all[rand(User.count)]
		)
end
puts 'finish'
puts 'create orders'
10.times do
	Order.create(cart_id: Cart.all.ids[rand(Cart.count)], book_id: Book.all.ids[rand(Book.count)])
end
