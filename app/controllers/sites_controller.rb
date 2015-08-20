class SitesController < ApplicationController

  def index
    if params[:search]
      @sites = Site.search(params[:search])
      Site.locationtype.each do |p|
        if params[p]
          @sites = @sites.filter(p, params[p])
        end
      @sites = @sites.pricefilter(params[:price])
      @price = params[:price]
      end
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
    params.require(:site).permit(:name, :street, :town, :county, :postcode, :description, :summary, :price, :accommodation_type, :occupancy, :available_from, :available_to, :image, :image_2, :image_3, :image_4, :image_5, :image_6, :toilet_block, :ensuite_toilet, :shower_block, :ensuite_shower, :'on-site_restaurant', :'on-site_shop', :cooking_facilities, :charging_facilities, :'on-site parking', :handicap_accessible, :wifi_available, :pets_welcome, :family_friendly, :no_children, :supermarket_nearby, :eco_friendly, :campfires_allowed, :barbecues_allowed, :towels_provided, :laundry_facilities, :forest, :lake, :mountain, :peaceful, :remote_location, :scenic, :good_for_hiking, :wildlife_haven, :canoeing_nearby, :climbing_nearby, :beach_nearby, :cycle_hire_nearby, :horse_riding_nearby, :sailing_nearby, :watersports_nearby, :pub_or_restaurant_nearby )
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
    redirect_to '/vendors'
  end
end
