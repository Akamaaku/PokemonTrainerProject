class TrainersController < ApplicationController
  def index
    @trainers = Trainer.order(:name)
  end

  def show
    @trainer = Trainer.includes(:team).find(params[:id])
  end
end
