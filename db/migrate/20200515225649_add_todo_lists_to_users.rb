class AddTodoListsToUsers < ActiveRecord::Migration
  def change
    add_column :todo_lists, :user_id, :reference
  end
end
