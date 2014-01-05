require 'spec_helper'

describe Prediction do

  let(:prediction) { Prediction.new }

  def create_prediction_with(prediction, prediction2, actual, actual2)
    Prediction.new(home_prediction: prediction, away_prediction: prediction2,
      match: Match.new(home_score: actual, away_score: actual2))
  end

  context "matching the exact score" do
    it "returns 3 when predicted score (1-0) match actual score (1-0)" do
      expect(create_prediction_with(1,0,1,0).score_points).to be 3
    end

    it "returns 3 when predicted score (5-3) match actual score (5-3)" do
      expect(create_prediction_with(5,3,5,3).score_points).to be 3
    end

    it "returns 0 when predicted score (1-0) does not match the actual score (0-1)" do
      expect(create_prediction_with(1,0,0,1).score_points).to be 0
    end
  end

  context "correctly predicting the result" do 
    it "returns 1 when an Home win is correctly predicted but not the exact score" do
      expect(create_prediction_with(3,0,5,0).score_points).to be 1
    end

    it "returns 1 when an Away win is correctly predicted but not the exact score" do
      expect(create_prediction_with(0,3,0,5).score_points).to be 1
    end

    it "returns 1 when a Draw is correctly predicted but not the exact score" do
      expect(create_prediction_with(1,1,2,2).score_points).to be 1
    end

    it "returns 0 when both the score and the result are wrong" do
      expect(create_prediction_with(4,0,0,1).score_points).to be 0
    end

  end

  context "assigning points" do

    it "assigns one point to a prediction if Home win correctly predicted but not exact score" do
      match = FactoryGirl.create(:match)
      match.stub(:match_finished?) { true }
      prediction = FactoryGirl.create(:prediction)
      prediction.assign_points
      expect(prediction.points).to eq 1
    end

  end


end
