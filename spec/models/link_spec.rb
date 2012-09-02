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

  context "scopes" do
    it "finds for year" do
      Link.for_date(2012).all.should include(google)
      Link.for_date(2012).all.should_not include(oldest)
    end

    it "finds for month" do
      Link.for_date(2012, 10).all.should include(halloween)
      Link.for_date(2012, 10).all.should_not include(oldest)
    end

    it "finds for day" do
      Link.for_date(2012, 10, 31).all.should include(halloween)
      Link.for_date(2012, 10, 31).all.should_not include(oldest)
    end
  end
end
