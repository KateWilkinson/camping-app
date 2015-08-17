class RequestsController < ApplicationController

  def index
    @sites = Site.all
  end

  def new
    @site = Site.find_by_id(session[:current_site_id])
    @request = Request.new
  end

  def create
    @site = Site.find_by_id(session[:current_site_id])
    @request = @site.requests.build(request_params)
    if @request.save
      flash[:notice] = "Thank you.  Your request has been made."
      redirect_to "/"
    else
      flash[:notice] = "Sorry. Request not processed due to incorrect information."
      redirect_to "/requests/new"
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to '/requests'
  end

  def request_params
    params.require(:request).permit(:customer_name, :customer_email, :customer_phone, :start_date, :end_date, :comments)
  end
end
