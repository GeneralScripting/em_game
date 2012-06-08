require 'spec_helper'

describe User do

  context "relations" do
    it { should have_many(:bets) }
    it { should have_many(:chat_messages) }
  end

  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:locale) }
    it { should validate_presence_of(:facebook_idx) }
  end

end
