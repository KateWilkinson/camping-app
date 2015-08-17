class VendorsController < ApplicationController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    # session[:current_site_id] = @site.id
  end

end
