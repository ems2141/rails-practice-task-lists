class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :task_list
      t.string :description
      t.date :due_date
      t.timestamps
    end
  end
end
