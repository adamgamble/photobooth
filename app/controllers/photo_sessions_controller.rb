class PhotoSessionsController < ApplicationController
  def show
    @photo_session = PhotoSession.find(params[:id])

    render :pdf => "photo_session_#{params[:id]}.pdf", :layout => false
  end
end
