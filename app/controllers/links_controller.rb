class LinksController < ApplicationController
  respond_to :json
  before_filter :admin_authenticate, only: :index

  def index
    from  = Chronic.parse params[:from]
    to    = Chronic.parse params[:to]

    @links = Link.for_date(from, to).recent
    respond_with @links do |format|
      format.html
    end
  end

  def show
    @link = Link.find params[:id]
    respond_with @link
  end

  def create
    @link = Link.create params[:link]
    respond_with @link
  end
end
