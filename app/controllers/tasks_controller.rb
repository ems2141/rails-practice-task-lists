class TasksController < ApplicationController

  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.new(params.require(:task).permit(:description, :due_date))
    @task.save
    redirect_to root_path, notice: 'Task was created successfully!'
  end
end