class TasksController < ApplicationController
  before_action :require_login

  def create
    @task = current_user.tasks.new(task_params)
    if @task.list.user_id == current_user.id
      @task.save
      redirect_to list_url(@task.list_id)
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to list_url(@task.list_id)
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to list_url(@task.list_id)
  end
#had null false on boolean
  def task_params
    params.require(:task).permit(:body, :completed, :list_id)
  end
end
