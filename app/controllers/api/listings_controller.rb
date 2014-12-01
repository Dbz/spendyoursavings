class Api::ListingsController < ApplicationController
  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: @listing, include: [:images, :shop, :reviews]
    else
      render json: @listing.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    @listing = Listing.find(params[:id])
    if @listing
      render :show_listing
    else
      render json: ["Listing not found"], status: 404
    end
  end
  
  def search
    @listings = Listing.search(params[:search][:text])
    render :search_listing
  end
  
  private
  def listing_params
    params.require(:listing).permit(:name, :price, :available, :description, :shop_id, :policies)
  end
end