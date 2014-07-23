class TasksController < ApplicationController

  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.new(params.require(:task).permit(:description, :due_date))
    if @task.save
      redirect_to root_path, notice: 'Task was created successfully!'
    else
      render :new
    end
  end

  def complete
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.find(params[:id])
    @task.completed = true
    @task.save!

    redirect_to root_path
  end
end