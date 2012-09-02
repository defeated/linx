require 'spec_helper'

describe Link do
  fixtures :links

  it { should_not be_valid }
  it "validates url" do
    links(:google).should be_valid
  end
end
