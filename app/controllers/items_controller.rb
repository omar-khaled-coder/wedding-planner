class ItemsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @item = @listing.items.build(item_params)

    if @item.save
      redirect_to @listing, notice: 'Item was successfully added.'
    else
      render 'listings/show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end
end
