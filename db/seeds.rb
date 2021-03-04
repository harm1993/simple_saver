# >>> Start with clear db

# Expense.destroy_all
# Category.destroy_all
# User.destroy_all

# >>> Create first user 
# user = User.create!(first_name: 'Francesca', last_name: 'Santoriello', date_of_birth: '01/02/1995', email: 'sf@gmail.com', password: '123456')


# >>> Assign params to category
# category_params = [{name: 'coffee'}]

# >>> Create category for each hash of params

# category_params.each do |param|
#   category = Category.create!(user: user, goal_per_month: (10..100).to_a.sample, **param)
#   5.times do |index|
     # >>> Create expenses relative to each category
#     Expense.create(amount: (2..10).to_a.sample, category: category)
#   end
# end
