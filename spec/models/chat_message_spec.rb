require 'spec_helper'

describe ChatMessage do

  context "relations" do
    it { should belong_to(:user) }
  end

  context "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:body) }
  end

end
