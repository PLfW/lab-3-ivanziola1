class Admin::GenresController < AdminController
  before_action :set_genre, only: [:edit, :update, :destroy]
  before_action :check_admin

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def edit
      @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_url, notice: 'Genre was successfully created.'
    else
      render :new
    end
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_url, notice: 'Genre was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_url, notice: 'Genre was successfully destroyed.'
  end
  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
