class SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])

  end

  def new
    @site = Site.new
  end

  def create
    session[:current_site_id] = @site.id
    @site = current_vendor.sites.build(site_params)
    if @site.save
      redirect_to '/vendors'
    else
      render 'new'
    end
  end


  def site_params
    params.require(:site).permit(:name, :town, :address, :postcode, :price, :description)
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update(site_params)
    redirect_to '/vendors'
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    flash[:notice] = 'Site deleted successfully'
    redirect_to '/vendors'
  end
end
