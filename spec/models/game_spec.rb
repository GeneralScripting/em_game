require 'spec_helper'

describe Game do

  context "relations" do
    it { should belong_to(:team_a) }
    it { should belong_to(:team_b) }
  end

  context "validations" do
    it { should validate_presence_of(:team_a) }
    it { should validate_presence_of(:team_b) }
    it { should validate_presence_of(:start_at) }
  end

end
