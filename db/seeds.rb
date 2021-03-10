puts 'clearing database...'

Expense.destroy_all
Category.destroy_all
Goal.destroy_all
User.destroy_all


puts 'creating our users...'

francesca = User.create!(first_name: 'Francesca', last_name: 'Milk', date_of_birth: '01/02/1995', email: 'milk@simplesaver.com', password: '123456')

harm = User.create!(first_name: 'Harm', last_name: 'Binnenkade', date_of_birth: '01/02/1995', email: 'harm@simplesaver.com', password: '123456')

fabrizio = User.create!(first_name: 'Fabrizio', last_name: 'Negretti', date_of_birth: '01/02/1995', email: 'fabrizio@simplesaver.com', password: '123456')

thomas = User.create!(first_name: 'Thomas', last_name: 'de Jong', date_of_birth: '01/02/1995', email: 'thomas@simplesaver.com', password: '123456')


puts 'assignign params to category...'

category_params = [{name: 'coffee'}, {name: 'shopping'}, {name: 'delivery'}]


puts 'creating categories and expenses...'

category_params.each do |param|
  category = Category.create!(user: francesca, goal_per_month: (50..100).to_a.sample, **param)
  5.times do |index|
    Expense.create(amount: (2..10).to_a.sample, category: category)
  end
end

category_params.each do |param|
  category = Category.create!(user: harm, goal_per_month: (50..100).to_a.sample, **param)
  5.times do |index|
    Expense.create(amount: (2..10).to_a.sample, category: category)
  end
end

category_params.each do |param|
  category = Category.create!(user: thomas, goal_per_month: (50..100).to_a.sample, **param)
  5.times do |index|
    Expense.create(amount: (2..10).to_a.sample, category: category)
  end
end

category_params.each do |param|
  category = Category.create!(user: fabrizio, goal_per_month: (50..100).to_a.sample, **param)
  5.times do |index|
    Expense.create(amount: (2..10).to_a.sample, category: category)
  end
end


puts 'creating the goals...'

goal = Goal.create!(user: francesca, name: 'New house', amount: 2000, deadline: Date.new(2021,5,9), saved: 800)
goal_h = Goal.create!(user: harm, name: 'Trip to Acapulco', amount: 800, deadline: Date.new(2021,5,9), saved: 600)
goal_t = Goal.create!(user: thomas, name: 'Trip to Asia', amount: 1000, deadline: Date.new(2021,5,9), saved: 600)
goal_f = Goal.create!(user: fabrizio, name: 'Trip to America', amount: 1200, deadline: Date.new(2021,5,9), saved: 800)

puts 'done!'