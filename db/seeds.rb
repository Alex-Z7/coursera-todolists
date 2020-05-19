# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#rake db:reset
users = [{first_name: "Carly", last_name: "Fiorina", gender: "female", birth_year: 1954},
        {first_name: "Donald", last_name: "Trump", gender: "male", birth_year: 1946},
        {first_name: "Ben", last_name: "Carson", gender: "male", birth_year: 1951},
        {first_name: "Hillary", last_name: "Clinton", gender: "female", birth_year: 1947}]


User.destroy_all
Profile.destroy_all

users.each do |user|
    u = User.create(username: user[:last_name], password_digest: "password")
    p = u.build_profile user
    p.save
end

TodoList.destroy_all
TodoItem.destroy_all
i=0
User.all.each do |user|
  i+=1
  list = TodoList.create!(list_name: "list_#{i.to_s}", list_due_date: 1.year.since(Date.today))
  user.todo_lists << list
	  j=0
	  5.times do 	
	  		j+=1
	 		item = TodoItem.create!(due_date: 1.year.since(Date.today), title: "Title: #{i.to_s}", description: "Description: #{i.to_s}", completed: true )		
	    	list.todo_items << item
	end
end