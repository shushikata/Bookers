class BooksController < ApplicationController
  def top 
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show 
    @book = Book.find(params[:id])
  end

  def create
    @book =Book.new(book_params)
    book.save 
    redirect_to book_path
  end

  def edit

  end

  def update 

  end

  def destroy 

  end


  def list_params
    params.require(:book).permit(:title, :body)
  end

end
