class PhotoSessionsController < ApplicationController
  def show
    File.open("test.html","w") {|f| f.write render_to_string }
    render :layout => false
  end
end
