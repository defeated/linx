require 'spec_helper'

describe "custom routes" do
  it "defaults root to links#index" do
    get(root_path).should route_to("links#index")
  end
end
