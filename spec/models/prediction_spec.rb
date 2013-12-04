require 'spec_helper'

describe Prediction do

  let(:prediction) { Prediction.new }

  context "matching the exact score" do
    it "returns 3 when predicted score (1-0) match actual score (1-0)" do
      expect(prediction.score_points(1,0,1,0)).to be 3
    end

    it "returns 3 when predicted score (5-3) match actual score (5-3)" do
      expect(prediction.score_points(5,3,5,3)).to be 3
    end

    it "returns 0 when predicted score (1-0) does not match the actual score (0-1)" do
      expect(prediction.score_points(1,0,0,1)).to be 0
    end
  end

  context "correctly predicting the result" do 
    it "returns 1 when an Home win is correctly predicted but not the exact score" do
      expect(prediction.score_points(3,0,5,0)).to be 1
    end

    it "returns 1 when an Away win is correctly predicted but not the exact score" do
      expect(prediction.score_points(0,3,0,5)).to be 1
    end

    it "returns 1 when a Draw is correctly predicted but not the exact score" do
      expect(prediction.score_points(1,1,2,2)).to be 1
    end

    it "returns 0 when both the score and the result are wrong" do
      expect(prediction.score_points(4,0,0,1)).to be 0
    end

  end
end
