class UsersController < ApplicationController
  def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save!
			flash[:notice] = "User created successfully"
			redirect_to users_path
		else
			flash[:error] = "User creation failed"
			render :new
		end
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update user_params
			flash[:notice] = "User update successfully"
			redirect_to users_path
		else
			flash[:error] = "User update failed"
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
    @user.destroy
		flash[:notice] = "User deleted successfully"
		redirect_to users_path
  end

	def show
		@user = User.find(params[:id])
    @user_boards = Board.where(user_id: @user)
    @teams = @user.teams
    @tasks = @user.assignee_tasks
	end

  private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
