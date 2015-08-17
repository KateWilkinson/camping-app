class SitesController < ApplicationController

  def index
    if params[:search]
      @sites = Site.search(params[:search]).order('created_at DESC')
    else
      @sites = Site.all
    end
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
    params.require(:site).permit(:name, :street, :town, :county, :postcode, :description, :summary, :price, :accommodation_type, :occupancy, :available_from, :available_to, :image, :image_2, :image_3, :image_4, :image_5, :image_6, :shared_toilets, :private_toilets, :shared_shower, :private_shower, :restaurant, :shop, :kitchen, :electricity, :parking, :handicap_access, :wifi, :pets, :family, :adults, :supermarket, :eco, :campfire, :bbq, :budget, :backpacker, :forest, :lake, :mountain, :peaceful, :remote, :scenic, :walking, :wildlife, :canoeing, :climbing, :cycling, :cycle_hire, :horseriding, :sailing, :watersports, :pub )
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
