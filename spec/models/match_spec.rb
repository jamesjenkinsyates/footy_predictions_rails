require 'spec_helper'

describe Match do

  it { should have_many :predictions }

  context 'checking match status' do

    it 'should know if a match has finished' do
      Timecop.freeze(2013, 12, 07, 15, 45, 00)
      match = FactoryGirl.build(:match)
      expect(match.match_finished?).to be_true
    end

  end

end
