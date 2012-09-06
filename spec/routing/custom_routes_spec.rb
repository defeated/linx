require 'spec_helper'

describe "custom routes" do
  it "defaults root to links#index" do
    get(root_path).should route_to("links#index")
  end

  it "handles friendly urls" do
    get("/foo").should_not be_routable
    %w(today yesterday last-week last-month).each do |phrase|
      get("/#{phrase}").should route_to("links#index", from: phrase)
    end
  end
end
