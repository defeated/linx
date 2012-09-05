require 'spec_helper'

describe Link do
  fixtures :links

  let(:google)    { links(:google)    }
  let(:oldest)    { links(:oldest)    }
  let(:halloween) { links(:halloween) }

  context "validations" do
    it { should_not be_valid }
    it "validates url" do
      links(:google).should be_valid
    end
  end

  context "#for_date" do
    it "defaults to today" do
      links = Link.for_date
      links.should include(google)
      links.should_not include(oldest)
    end

    it "finds since specified date" do
      links = Link.for_date halloween.created_at
      links.should include(google)
      links.should include(halloween)
      links.should_not include(oldest)
    end

    it "finds between specified dates" do
      links = Link.for_date oldest.created_at, halloween.created_at
      links.should include(halloween)
      links.should include(oldest)
      links.should_not include(google)
    end
  end
end
