class BandsController < ApplicationController
  def new
    @band = Band.new
    render :new
  end

  def show
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to bands_url
    else
      flash[:errors] << ["Invalid band name"]
      redirect_to new_band_url
    end
  end

  def destroy
  end

  def index
    @bands = Band.all
    render :index
  end

  def update
  end

  def edit
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
