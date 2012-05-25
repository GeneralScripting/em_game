require 'spec_helper'

describe Team do

  context "relations" do
    
  end

  context "validations" do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:group) }
  end

end
