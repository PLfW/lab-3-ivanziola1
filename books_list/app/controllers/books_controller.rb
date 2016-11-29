class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:genres)
                 .search(params[:keyword]).filter(params[:filter]).approved
    @genres = Genre.all
  end

  def show
   end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end
  end


  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :amazon_id,
                                 { genre_ids: [] }, :rating)
  end
end
