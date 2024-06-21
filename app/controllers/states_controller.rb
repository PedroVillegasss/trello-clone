class StatesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @board = Board.find(params[:board_id])
    @state = @board.states.build
  end

  def create
    id = params[:board_id]
    @board = Board.find(id)
    @state = @board.states.build(state_params)
    if @state.save
      flash[:notice] = "State created successfully"
      redirect_to board_path(@board)
    else
      flash[:error] = "State creation failed"
      render :new
    end
  end

  def destroy
		@state = State.find(params[:id])
    @board = @state.board
    @state.destroy
		flash[:notice] = "State deleted successfully"
		redirect_to board_path(@board)
  end

  def edit
		@state = State.find(params[:id])
	end

	def update
		@state = State.find(params[:id])
    @board = @state.board
		if @state.update state_params
			flash[:notice] = "State updated successfully"
			redirect_to board_path(@board)
		else
			flash[:error] = "State update failed"
			render :edit
		end
	end

  private

	def state_params
		params.require(:state).permit(:name, :position)
	end
end
