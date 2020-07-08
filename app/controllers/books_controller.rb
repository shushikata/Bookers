class BooksController < ApplicationController
  def top 
  end

  def index #books　投稿一覧
    @books = Book.all
    @book = Book.new
  end

  def show #book　投稿内容詳細ページ
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save 
    flash[:notice] = "Book was successfully create."
    redirect_to book_path(@book.id)
  end

  def edit #edit_book　投稿内容編集ページ

  end

  def destroy 
    book = Book.find(params[:id])
    book.destroy 
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
