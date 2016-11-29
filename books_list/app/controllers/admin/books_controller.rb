class Admin::BooksController < AdminController
  before_action :set_book, only: [:edit, :update, :destroy, :approve]
  before_action :check_admin

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @genres = Genre.all
  end

  def edit
      @genres = Genre.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_url, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to admin_books_url, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to admin_books_url, notice: 'Book was successfully destroyed.'
  end

  def approve
     @book.update(approved: true)
      redirect_to admin_books_url, notice: 'Book was successfully approved.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :amazon_id,
                                 :approved, { genre_ids: [] }, :rating)
  end
end
