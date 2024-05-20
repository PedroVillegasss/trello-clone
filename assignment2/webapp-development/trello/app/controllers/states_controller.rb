class StatesController < ApplicationController
  def new
    @board = Board.find(params[:board_id])
    @state = @board.states.build
  end

  def create
    id = params[:board_id]
    @board = Board.find(id)
    @state = @board.states.build(state_params)
    if @state.save
      flash[:success] = "State successfully created"
      redirect_to board_path(@board)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

	def state_params
		params.require(:state).permit(:name, :position)
	end
end
