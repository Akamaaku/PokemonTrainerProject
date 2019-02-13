class TrainersController < ApplicationController
  def index
    @trainers = Trainer.order(:name).page(params[:page])
  end

  def show
    @trainer = Trainer.includes(:team).find(params[:id])
  end
end
