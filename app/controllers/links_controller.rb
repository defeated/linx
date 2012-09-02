class LinksController < ApplicationController
  respond_to :json

  def index
    if year = params[:year]
      @links = Link.for_date year, params[:month], params[:day]
    else
      @links = Link.all
    end
    respond_with @links
  end

  def show
    @link = Link.find(params[:id])
    respond_with @link
  end

  def create
    @link = Link.new params[:link]
    @link.save
    respond_with @link
  end
end
