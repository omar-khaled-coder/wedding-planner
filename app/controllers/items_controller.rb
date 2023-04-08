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

  # def destroy
  #   @item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to listings_url, notice: "item was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:photo, :name, :price, :description)
  end
end
