class TasksController < ApplicationController
  before_action :set_state, only: [:new, :create, :edit, :update, :destroy]

  def new
    @task = @state.tasks.build
  end

  def create
    @task = @state.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to board_path(@state.board_id)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "Task successfully updated"
      redirect_to board_path(@task.state.board_id)
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to board_path(@task.state.board_id), notice: "Task was successfully deleted."
  end

  private

  def set_state
    @state = State.find(params[:state_id])
  end

  def task_params
    params.require(:task).permit(:name, :informer_user_id_id, :assignee_user_id_id, :priority, :description, :label_id, :state_id)
  end
end
