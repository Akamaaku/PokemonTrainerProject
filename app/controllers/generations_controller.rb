class GenerationsController < ApplicationController
  def index
    @generations = Generation.all
  end

  def show
    @generation = Generation.includes(:pokemons, :games).find(params[:id])
  end
end
