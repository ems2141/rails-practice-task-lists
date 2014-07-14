class AddMonthToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :month, :string
    add_column :tasks, :day, :integer
  end
end
