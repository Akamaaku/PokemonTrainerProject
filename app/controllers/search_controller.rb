class SearchController < ApplicationController
  def results
    @query = params[:input]
    @trainers = Trainer.where('name LIKE ?', "%#{@query}%")
    @team = Team.where('teamName LIKE ?', "%#{@query}%")
    @team_members = TeamMember.where('nickname LIKE ?', "%#{@query}%")
    @pokemons = Trainer.where('name LIKE ?', "%#{@query}%")
    @generations = Trainer.where('generation LIKE ?', "%#{@query}%")
    @games = Trainer.where('title LIKE ?', "%#{@query}%")
  end
end
