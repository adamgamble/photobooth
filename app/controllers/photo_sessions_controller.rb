class PhotoSessionsController < ApplicationController
  def index
    @photo_sessions = PhotoSession.order(:created_at => :desc)
  end

  def show
    @photo_session = PhotoSession.find(params[:id])

    html = render_to_string
    save_path = "#{Rails.root}/tmp/photo_session_#{params[:id]}.html"
    pdf_save_path = "#{Rails.root}/tmp/photo_session_#{params[:id]}.pdf"
    File.open(save_path, 'wb') do |file|
        file << html
    end
    `wkhtmltopdf --page-width 5in --page-height 7in --margin-left 0 --margin-right 0 --margin-top 0 --margin-bottom 0 #{save_path} #{pdf_save_path}`
    send_file(pdf_save_path, :filename => "photo_session_#{@photo_session.id}.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def print
    @photo_session = PhotoSession.find(params[:photo_session_id])

    html = render_to_string
    save_path = "#{Rails.root}/tmp/photo_session_#{params[:photo_session_id]}.html"
    pdf_save_path = "#{Rails.root}/tmp/photo_session_#{params[:photo_session_id]}.pdf"
    File.open(save_path, 'wb') do |file|
        file << html
    end
    `wkhtmltopdf --page-width 5in --page-height 7in --margin-left 0 --margin-right 0 --margin-top 0 --margin-bottom 0 #{save_path} #{pdf_save_path}`
    `lpr #{pdf_save_path}`
    redirect_to photo_session_path(@photo_session)
  end
end
