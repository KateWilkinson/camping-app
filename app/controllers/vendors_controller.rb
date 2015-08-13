class VendorsController < ApplicationController

  def index
    @sites = Site.all
  end

end
