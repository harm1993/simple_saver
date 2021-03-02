# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# I put this line just to try if push works

Expense.destroy_all
Category.destroy_all
User.destroy_all
user = User.create!(first_name: 'Francesca', last_name: 'Santoriello', date_of_birth: '01/02/1995', email: 'sf@gmail.com', password: '123456')

category_params = [{name: 'coffee'}]

category_params.each do |param|
  category = Category.create!(user: user, goal_per_month: (10..100).to_a.sample, **param)
  5.times do |index|
    Expense.create(amount: (2..10).to_a.sample, category: category)
  end
end
