require 'spec_helper'

describe Bet do

  context "relations" do
    it { should belong_to(:game) }
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of(:game) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:team_a_goals) }
    it { should validate_presence_of(:team_b_goals) }
  end

end
