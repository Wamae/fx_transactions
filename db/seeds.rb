# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '*'*80
customer = Customer.create!({ email: 'test_customer@gmail.com', first_name: 'Jane', last_name: 'Doe' })
puts 'Seeded customer'

kes = Currency.create({code: 'KES'})
usd = Currency.create({code: 'USD'})
puts 'Seeded currencies'

customer.fx_transactions.create!({in_amount: 10_000.00, out_amount: 9_950.00, identifier: SecureRandom.uuid, in_currency: kes, out_currency: usd})
puts "Seeded customer's transactions"


puts '*'*80