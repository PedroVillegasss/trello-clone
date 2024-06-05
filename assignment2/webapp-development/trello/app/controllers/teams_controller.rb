class TeamsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

  def index
    @teams = Team.all
  end

  def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save!
			flash[:notice] = "Team created successfully"
			redirect_to teams_path
		else
			render :new
			flash[:error] = "Team creation failed"
		end
	end

  def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		if @team.update team_params
			flash[:notice] = "Team updated successfully"
			redirect_to teams_path
		else
			render :edit
			flash[:error] = "Team update failed"
		end
	end

  def show
		@team = Team.find(params[:id])
    @team_boards = Board.where(team_id: @team)
	end

  def destroy
    @team = Team.find(params[:id])
		@team.boards.update_all(team_id: nil)
    @team.destroy
    redirect_to teams_path
    flash[:notice] = "Team deleted successfully"
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
