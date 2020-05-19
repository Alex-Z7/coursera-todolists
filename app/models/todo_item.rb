class TodoItem < ActiveRecord::Base
  belongs_to :todo_list, class_name: "TodoList"
  default_scope {order :due_date}
end
