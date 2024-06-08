class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:create]

  def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save!
			flash[:notice] = "User created successfully"
			redirect_to users_path
		else
			render :new
			flash[:error] = "User creation failed"
		end
	end

	def index
		@users = User.all
	end

	def edit
		if current_user.id == params[:id]
			@user = User.find(params[:id])
		else
			flash[:notice] = "You can only edit yourself."
			redirect_to users_path
		end
	end

	def update
		@user = User.find(params[:id])
		if current_user.id == @user.id
			if @user.update user_params
				flash[:notice] = "User updated successfully"
				redirect_to users_path
			else
				render :edit
				flash[:error] = "User update failed"
			end
		else
			flash[:notice] = "You can only edit yourself."
			redirect_to users_path
		end
	end

	def destroy
		@user = User.find(params[:id])

		if current_user.id == @user.id
			Board.where(user_id: @user.id).destroy_all
			Task.where(assignee_user_id_id: @user.id).update_all(assignee_user_id_id: nil)
			@user.destroy
			flash[:notice] = "User deleted successfully"
			redirect_to users_path
		else
			flash[:notice] = "You can only destroy yourself."
			redirect_to users_path
		end
  end

	def show
		@user = User.find(params[:id])
    @user_boards = Board.where(user_id: @user)
    @user_teams = @user.teams
    @user_tasks = @user.assignee_tasks
	end

  private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
