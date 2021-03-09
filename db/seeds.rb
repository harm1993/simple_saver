# >>> Start with clear db
Expense.destroy_all
Category.destroy_all
User.destroy_all

# >>> Create first user 
user = User.create!(first_name: 'Francesca', last_name: 'Milk', date_of_birth: '01/02/1995', email: 'milk@simplesaver.com', password: '123456')

# >>> Assign params to category
category_params = [{name: 'coffee'}, {name: 'shopping'}, {name: 'delivery'}]

# >>> Create category and 5 expenses for each hash of params
category_params.each do |param|
  category = Category.create!(user: user, goal_per_month: (50..100).to_a.sample, **param)
  5.times do |index|
    Expense.create(amount: (2..10).to_a.sample, category: category)
  end
end
