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
    
    err_hash = {}
    if @prediction.save
      @prediction.user.use_double_credit if @prediction.double
    else
      [:home_prediction, :away_prediction, :first_goalscorer, :double].each do |key|
        err_hash[key] = @prediction.errors[key] if @prediction.errors[key].any?
      end
    end
    render json: {errors: err_hash, is_valid: @prediction.valid?, url: "#{predictions_path}/#{@prediction.id}"}
  end

  def update
    @prediction = Prediction.find(params[:id])
    current_double_status = @prediction.double

    err_hash = {}
    if @prediction.update(prediction_params)
      @prediction.user.use_double_credit if @prediction.double && !current_double_status
    else
      [:home_prediction, :away_prediction, :first_goalscorer, :double].each do |key|
        err_hash[key] = @prediction.errors[key] if @prediction.errors[key].any?
      end
    end
    render json: {errors: err_hash, is_valid: @prediction.valid?, url: "#{predictions_path}/#{@prediction.id}"}
  end

  def show
    @prediction = Prediction.find(params[:id])
    @match = @prediction.match
  end

  def check
    @prediction = Prediction.new(prediction_params)

    err_hash = {}
    unless @prediction.valid?
      [:home_prediction, :away_prediction, :first_goalscorer, :double].each do |key|
        err_hash[key] = @prediction.errors[key] if @prediction.errors[key].any?
      end
    end
    render json: {errors: err_hash, errors_count: err_hash.keys.size}
  end
  
  private
    def prediction_params
      params.require(:prediction).permit(:user_id, :match_id, :home_prediction, :away_prediction, :first_goalscorer, :double)
    end

end
