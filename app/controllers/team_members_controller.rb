class TeamMembersController < ApplicationController
  def index
    @team_members = TeamMember.order(:team_id)
  end

  def show
    @team_member = TeamMember.includes(:pokemon).find(params[:id])
  end
end
