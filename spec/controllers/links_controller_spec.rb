require 'spec_helper'

describe LinksController do
  fixtures :links

  let(:google) { links(:google) }

  it "gets all links via json" do
    get :index, format: :json
    response.should be_ok
    response.content_type.should == Mime::JSON
    assigns(:links).should include(google)
  end

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
end
