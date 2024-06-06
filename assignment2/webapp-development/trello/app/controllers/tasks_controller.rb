class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new(state_id: params[:state_id])
    @state = State.find(params[:state_id])
  end

  def show
    @task = Task.find(params[:id])
    @state = @task.state
    @board = @state.board
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task created successfully"
      redirect_to board_path(@task.state.board)
    else
      flash[:error] = "Task creation failed"
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @state = @task.state
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task update successfully"
      redirect_to board_path(@task.state.board_id)
    else
      flash[:error] = "Task update failed"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    flash[:notice] = "Task deleted successfully"
    @task.destroy
    redirect_to board_path(@task.state.board_id)
  end

  private

  def task_params
    params.require(:task).permit(:name, :informer_user_id_id, :assignee_user_id_id, :priority, :description, :label_id, :state_id)
  end
end
