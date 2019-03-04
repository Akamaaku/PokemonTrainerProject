class TeamsController < ApplicationController
  def index
    @teams = Team.all.page(params[:page])
  end

  def show
    @team = Team.includes(:team_members).find(params[:id])
  end
end
