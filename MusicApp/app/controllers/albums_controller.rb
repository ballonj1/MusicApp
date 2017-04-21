class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to bands_url
    else
      flash[:errors] << ["Invalid album input"]
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def update
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :name, :performed)
  end
end
