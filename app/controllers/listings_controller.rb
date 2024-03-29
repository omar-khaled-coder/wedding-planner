class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @listing.items.build # Build a new Item associated with the Listing
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
    @listing.items.build # make sure you build the items association
  end



  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_items
    @listing = Listing.new
    @listing.items.build

    if request.post?
      if @listing.update(listing_params)
        redirect_to @listing, notice: 'Items added successfully'
      else
        render :new
      end
    end
  end


  # PATCH/PUT /listings/1 or /listings/1.json

  def update
    respond_to do |format|
      if @listing.update(listing_params.except(:photos))
        if params[:listing][:photos].present?
          params[:listing][:photos].each do |photo|
            @listing.photos.attach(photo)
          end
        end
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.

  def set_listing

    @listing = Listing.find(params[:id])
  end

    # Only allow a list of trusted parameters through.

    def listing_params
      params.require(:listing).permit(:name, :rating, :description, :short_description, :location, :price, :duration, :capacity, :user_id, photos: [], photos_attachments: [:id, :_destroy], items_attributes: [:photo, :name, :price, :description])
    end
end
