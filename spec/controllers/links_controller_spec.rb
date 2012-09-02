require 'spec_helper'

describe LinksController do
  fixtures :links

  let(:google)    { links(:google)    }
  let(:oldest)    { links(:oldest)    }
  let(:halloween) { links(:halloween) }

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

  context "for date" do
    subject { assigns(:links) }

    it "gets links for 2012 via json" do
      get :index, format: :json, year: 2012
      should include(google)
      should include(halloween)
      should_not include(oldest)
    end

    it "gets links for 2012-10 via json" do
      get :index, format: :json, year: 2012, month: 10
      should include(halloween)
      should_not include(google)
      should_not include(oldest)
    end

    it "gets links for 2012-10-31 via json" do
      get :index, format: :json, year: 2012, month: 10, day: 31
      should include(halloween)
      should_not include(google)
      should_not include(oldest)
    end
  end
end
