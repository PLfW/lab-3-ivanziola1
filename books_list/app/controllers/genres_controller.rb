class GenresController < ApplicationController
  def index
    @genres = Genre.all
    respond_to do |format|
      format.html {render nothing: true, status: 200, content_type: 'text/html' }
      format.json { render json: @genres }
    end

  end
end
