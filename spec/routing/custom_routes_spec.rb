require 'spec_helper'

describe "custom routes" do
  it "routes years" do
    get("/2012").should route_to("links#index", year: "2012")
  end

  it "routes months" do
    get("/2012/10").should route_to("links#index", year: "2012", month: "10")
  end

  it "routes years" do
    get("/2012/10/31").should route_to("links#index", year: "2012",
      month: "10", day: "31")
  end
end
