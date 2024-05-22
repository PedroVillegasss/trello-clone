class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @team_boards = Board.where(team_id: @team)
    @users = @team.users
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    selected_user_ids = params[:team][:user_ids]
    if selected_user_ids.present?
      selected_users = User.where(id: selected_user_ids)
      @team.users << selected_users
    end
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update team_params
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  def team_params
    params.require(:team).permit(:team_id, :name, user_ids: [])
  end
end
