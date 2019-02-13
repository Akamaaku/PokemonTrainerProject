class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.includes(:team_members).find(params[:id])
  end
end
