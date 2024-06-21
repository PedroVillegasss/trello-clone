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
    @task.informer_user_id_id = current_user.id
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
      respond_to do |format|
        format.html { redirect_to board_path(@task.state.board_id), notice: 'Task updated successfully' }
        format.json { render json: @task, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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
    params.require(:task).permit(:name, :assignee_user_id_id, :priority, :description, :label_id, :state_id)
  end
end
