class SharesController < ApplicationController
  before_action :set_share, only: %i[show edit update destroy]

  def index
    @q = Share.ransack(params[:q])
    @shares = @q.result(distinct: true).includes(:recipe).page(params[:page]).per(10)
  end

  def show; end

  def new
    @share = Share.new
  end

  def edit; end

  def create
    @share = Share.new(share_params)

    if @share.save
      message = "Share was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @share, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @share.update(share_params)
      redirect_to @share, notice: "Share was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @share.destroy
    message = "Share was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to shares_url, notice: message
    end
  end

  private

  def set_share
    @share = Share.find(params[:id])
  end

  def share_params
    params.require(:share).permit(:recipe_id, :recipient_id)
  end
end
