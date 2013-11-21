class PredictionsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create  
    @prediction = Prediction.new(prediction_params)
  end
  
end
