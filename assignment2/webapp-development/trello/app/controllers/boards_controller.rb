class BoardsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

  def index
    @boards = Board.all
  end

  def home
    @boards_limited = Board.order(created_at: :desc).limit(3)
  end

  def show
    id = params['id']
    @board = Board.find(id)
		if current_user.id != @board.user_id
			flash[:alert] = "You are not authorized to see this board"
			redirect_to boards_path
		end
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
			flash[:notice] = "Board created successfully"
			redirect_to boards_path
		else
			flash[:error] = "Board creation failed"
			render :new
		end
	end

	def edit
		@board = Board.find(params[:id])
		if current_user.id != @board.user_id
			flash[:alert] = "You are not authorized to edit this board"
			redirect_to boards_path
		end
	end

	def update
		@board = Board.find(params[:id])
		if current_user.id != @board.user_id
			flash[:alert] = "You are not authorized to edit this board"
			redirect_to boards_path
		else
			if @board.update board_params
				flash[:notice] = "Board updated successfully"
				redirect_to board_path
			else
				flash[:error] = "Board update failed"
				render :edit
			end
		end
	end

	def destroy
		@board = Board.find(params[:id])
		if current_user.id != @board.user_id
			flash[:alert] = "You are not authorized to delete this board"
			redirect_to boards_path
		else
			@board.destroy
			flash[:notice] = "Board deleted successfully"
			redirect_to boards_path
		end
  end

  private

	def board_params
		params.require(:board).permit(:user_id, :team_id, :name, :color, :is_public)
	end
end
