module Api
  class SitesController < ApplicationController
    respond_to :json

    def index
      respond_with Site.all
    end

    def show
      respond_with Site.find(params[:id])
    end

    def create
      respond_with Site.create(params[:site])
    end

    def update
      respond_with Site.update(params[:id], params[:product])
    end

    def destroy
      respond_with Site.destroy(params[:id])
    end
    
  end
end
