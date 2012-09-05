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
      links_for_date = Link.for_date
      links_for_date.should      include(google)
      links_for_date.should_not  include(oldest)
    end

    it "finds on specified date" do
      links_for_date = Link.for_date halloween.created_at
      links_for_date.should      include(halloween)
      links_for_date.should_not  include(google, oldest)
    end

    it "finds between specified dates" do
      links_for_date = Link.for_date oldest.created_at, halloween.created_at
      links_for_date.should      include(halloween, oldest)
      links_for_date.should_not  include(google)
    end
  end
end
