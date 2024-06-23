class TeamsController < ApplicationController
	before_action :authenticate_user!

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
    @team_members = @team.users

    unless @team_members.include?(current_user)
      flash[:notice] = "Only the members can edit the team."
      redirect_to teams_path
    end
  end

  def update
    @team = Team.find(params[:id])
    @team_members = @team.users

    unless @team_members.include?(current_user)
      flash[:notice] = "Only the members can edit the team."
      redirect_to teams_path
    else
      if @team.update(team_params)
        flash[:notice] = "Team updated successfully."
        redirect_to teams_path
      else
        flash[:error] = "Team update failed."
        render :edit
      end
    end
  end

  def show
		@team = Team.find(params[:id])
    @team_boards = Board.where(team_id: @team)
		@team_members = @team.users
	end

	def destroy
		@team = Team.find(params[:id])
		@team.boards.update_all(team_id: nil)
		@team_members = @team.users

		unless @team_members.include?(current_user)
			flash[:notice] = "Only the members can edit the team."
			redirect_to teams_path
		else
			@team.destroy
			flash[:notice] = "Team deleted successfully."
			redirect_to teams_path
		end
	end

  private

  def team_params
    params.require(:team).permit(:name)
  end

end
