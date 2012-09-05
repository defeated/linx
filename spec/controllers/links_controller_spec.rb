require 'spec_helper'

describe LinksController do
  fixtures :links

  let(:google)    { links(:google)    }
  let(:oldest)    { links(:oldest)    }
  let(:halloween) { links(:halloween) }

  it "creates a valid link" do
    post :create, format: :json, link: { url: "http://example.com" }
    response.status.should == 201 # :created
  end

  it "fails to create an invalid link" do
    post :create, format: :json
    response.status.should == 422 # :unprocessable_entity
  end

  it "gets an existing link" do
    get :show, format: :json, id: google.id
    response.body.should == google.to_json
  end

  context "for date" do
    subject { assigns(:links) }

    before :each do
      session[:admin_auth] = "rspec@litmusapp.com"
    end

    it "gets links for today via json" do
      get :index, format: :json
      response.should be_ok
      response.content_type.should == Mime::JSON
      should      include(google)
      should_not  include(oldest)
    end

    it "gets links for specific date via json" do
      get :index, format: :json, from: halloween.created_at
      should      include(halloween)
      should_not  include(google, oldest)
    end

    it "gets links between dates via json" do
      get :index, format: :json, from: oldest.created_at, to: Time.now
      should include(google, halloween, oldest)
    end
  end
end
