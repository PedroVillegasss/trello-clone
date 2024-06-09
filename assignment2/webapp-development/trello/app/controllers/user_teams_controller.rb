class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_team = UserTeam.new
  end

  def create
    team_id = user_teams_params[:team_id]
    check_test = UserTeam.find_by(user_id: current_user.id, team_id: team_id)

    if check_test
      flash[:notice] = "You are already a member of this team."
      redirect_to teams_path
    else
      @user_team = UserTeam.new(user_teams_params)
      @user_team.user = current_user
      if @user_team.save!
        flash[:notice] = "Member joined successfully."
        redirect_to teams_path
      else
        flash[:notice] = "Member join failed."
        render :new
      end
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  private
  def user_teams_params
    params.require(:user_team).permit(:team_id)
  end
end
