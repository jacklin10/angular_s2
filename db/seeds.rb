# Create Seed Users

puts "-> Creating system users"
u = User.create!(email: 'jacklin10+user@gmail.com',
  first_name: 'Joe',
  last_name: 'Acklin',
  password: 'password',
  password_confirmation: 'password',
)

u.confirm! # For devise
u.save!

Customer.create!(first_name: 'Joe', last_name: 'Acklin')
Customer.create!(first_name: 'Butt', last_name: 'Head')
