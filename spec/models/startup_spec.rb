require 'rails_helper'

RSpec.describe Startup, :type => :model do
  context "validation" do
    subject{ build(:startup) }
    it {should be_valid}
    it "should require a url" do
      expect(
      build(:startup url: nil)
      ).not_to be_valid
    end
    it "should require a name" do
      expect(
      build(:startup, name: nil)
      ).not_to be_valid
    end    
  end
end