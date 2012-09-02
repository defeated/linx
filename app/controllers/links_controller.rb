class LinksController < ApplicationController
  respond_to :json

  def index
    respond_with @links = Link.all
  end

  def show
    respond_with @link = Link.find(params[:id])
  end

  def create
    @link = Link.new params[:link]
    @link.save
    respond_with @link
  end
end
