class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current_band, :all_bands,
    :bands_album

  def bands_album
    Album.select(:name).where(" band_id = ?", current_band.id)
  end

  def all_bands
    Band.all
  end

  def current_band
    Band.find_by(id: params[:id])
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end
end
