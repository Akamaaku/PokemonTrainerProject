class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order(:pokedexID).page(params[:page])
  end

  def show
    @pokemon = Pokemon.includes(:generation, :type, :team_members).find(params[:id])
  end
end
