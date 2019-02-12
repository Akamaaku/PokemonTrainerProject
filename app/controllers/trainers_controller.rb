class TrainersController < ApplicationController
  def index
    @trainers = Trainer.order(:name)
  end

  def show
    @trainer = Trainer.include(:teams).find(params[:id])
  end
end
