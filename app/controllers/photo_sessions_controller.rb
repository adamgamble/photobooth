class PhotoSessionsController < ApplicationController
  def show
    @photo_session = PhotoSession.find(params[:id])

    html = render_to_string
    save_path = "#{Rails.root}/tmp/photo_session_#{params[:id]}.html"
    pdf_save_path = "#{Rails.root}/tmp/photo_session_#{params[:id]}.pdf"
    File.open(save_path, 'wb') do |file|
        file << html
    end
    `wkhtmltopdf --page-width 5in --page-height 7in --margin-left 0 --margin-right 0 --margin-top 0 --margin-bottom 0 #{save_path} #{pdf_save_path}`
    `lpr #{pdf_save_path}`
    render :pdf => "photo_session_#{params[:id]}.pdf", :layout => false,
      :margin => {:top => 0, :left => 0, :right => 0, :bottom => 0}, :extra => "--page-height 7in --page-width 5in"
  end
end
