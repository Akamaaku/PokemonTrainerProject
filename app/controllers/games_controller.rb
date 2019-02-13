class GamesController < ApplicationController
  def index
    @games = Game.order(:dateCreated)
  end

  def show
    @game = Game.includes(:generations).find(params[:id])
  end
end
