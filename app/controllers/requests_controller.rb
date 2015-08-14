class RequestsController < ApplicationController

  def new
    @site = Site.find(params[:site_id])
    @request = Request.new
  end

  def create
    @site = Site.find(params[:site_id])
    @request = @site.requests.build(request_params)
    if @request.save
      flash[:notice] = "Your request has been made"
      redirect_to "/"
    else
      flash[:notice] = "Sorry. Request not processed"
    end
  end

  def request_params
    params.require(:request).permit(:customer_name, :customer_email, :customer_phone, :start_date, :end_date, :comments)
  end
end
