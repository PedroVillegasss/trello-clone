class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def home
    @boards_limited = Board.order(created_at: :desc).limit(3)
  end

  def show
    id = params['id']
    @board = Board.find(id)
  end

  def table
    @boards = Board.all
  end

  def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		if @board.save!
				redirect_to boards_path
		else
				render :new
		end
	end

	def edit
		@board = Board.find(params[:id])
	end

	def update
		@board = Board.find(params[:id])
		if @board.update board_params
				redirect_to boards_path
		else
				render :edit
		end
	end

	def destroy
		@board = Board.find(params[:id])
    @board.destroy
		redirect_to boards_path
  end

  private

	def board_params
		params.require(:board).permit(:user_id, :team_id, :name, :color, :is_public)
	end
end
