class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @tasks = Task.all
  end

end