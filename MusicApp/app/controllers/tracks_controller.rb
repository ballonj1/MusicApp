class TracksController < ApplicationController
  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to band_url(@track)
    else
      flash[:errors] << ["Invalid track name"]
    end
  end

  private
  def track_params
    params.require(:track).permit(:name, :lyrics, :album_id, :track_type)
  end
end
