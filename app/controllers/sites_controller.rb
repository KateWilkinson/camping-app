class SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    session[:current_site_id] = @site.id

  end

  def new
    @site = Site.new
  end

  def create

    @site = current_vendor.sites.build(site_params)
    if @site.save
      redirect_to '/vendors'
    else
      render 'new'
    end
  end


  def site_params
    params.require(:site).permit(:name, :town, :county, :street, :postcode, :price, :description, :image, :image_2, :image_3, :image_4, :image_5, :image_6)
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
