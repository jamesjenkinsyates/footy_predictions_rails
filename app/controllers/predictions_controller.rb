class PredictionsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @prediction = Prediction.new
  end

  def edit
    @prediction = Prediction.find(params[:id])
  end

  def create
    @prediction = Prediction.new(prediction_params)
    
    if @prediction.save
      @prediction.user.use_double_credit if @prediction.double
      redirect_to dashboard_path
    else
      @matches = Match.all
      redirect_to dashboard_path
      flash[:error] = "Prediction Failed: #{@prediction.errors.full_messages}"
    end
  end

  def update
    @prediction = Prediction.find(params[:id])
    current_double_status = @prediction.double
    if @prediction.update(prediction_params)
      # require 'pry'
      # binding.pry
      @prediction.user.use_double_credit if @prediction.double && !current_double_status
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
      flash[:error] = "Prediction Edit Failed: #{@prediction.errors.full_messages}"
    end
  end

  def show
    @prediction = Prediction.find(params[:id])
    @match = @prediction.match
  end
  
  private
    def prediction_params
      params.require(:prediction).permit(:user_id, :match_id, :home_prediction, :away_prediction, :first_goalscorer, :double)
    end

end
