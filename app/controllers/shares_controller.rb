class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  # GET /shares
  def index
    @shares = Share.all
  end

  # GET /shares/1
  def show
  end

  # GET /shares/new
  def new
    @share = Share.new
  end

  # GET /shares/1/edit
  def edit
  end

  # POST /shares
  def create
    @share = Share.new(share_params)

    if @share.save
      redirect_to @share, notice: 'Share was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shares/1
  def update
    if @share.update(share_params)
      redirect_to @share, notice: 'Share was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shares/1
  def destroy
    @share.destroy
    message = "Share was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to shares_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def share_params
      params.require(:share).permit(:recipe_id, :recipient_id)
    end
end
