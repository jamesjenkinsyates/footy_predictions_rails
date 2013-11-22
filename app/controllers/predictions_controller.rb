class PredictionsController < ApplicationController

  def index
    @predictions = Prediction.all
  end

  def new
    @matches = Match.all
    @prediction = Prediction.new
  end

  def create 
    @prediction = Prediction.new(prediction_params)
    if @prediction.save
      redirect_to @prediction
    else
      @matches = Match.all
      render 'new'
    end
  end

  def show
    @prediction = Prediction.find(params[:id])
    @match = @prediction.match
  end
  
    private
      def prediction_params
        params.require(:prediction).permit(:match_id, :home_prediction, :away_prediction, :first_goalscorer)
      end

end
