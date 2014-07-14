class TasksController < ApplicationController

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new(description: params[:task][:description],
                     task_list_id: @task_list.id
    )
    if @task.save
      redirect_to task_lists_path
    end

  end
end