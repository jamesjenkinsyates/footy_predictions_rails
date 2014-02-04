class PredictionsController < ApplicationController

  before_filter :authenticate_user!

  # def index
  #   @predictions = current_user.match_predictions
  # end

  def new
    @prediction = Prediction.new
  end

  def edit
    @prediction = Prediction.find(params[:id])
  end

  def create
    @prediction = Prediction.new(prediction_params)
    if @prediction.save
      redirect_to dashboard_path
    else
      @matches = Match.all
      redirect_to dashboard_path
      flash[:error] = "Prediction Failed: #{@prediction.errors.full_messages}"
    end
  end

  def update
    @prediction = Prediction.find(params[:id])
    if @prediction.update(prediction_params)
      redirect_to dashboard_path
    else
      flash.now[:error] = "Prediction Edit Failed: #{@prediction.errors.full_messages}"
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
