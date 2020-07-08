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
    if @book.save 
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else  
      @books = Book.all 
      render ("books/index")
    end
  end

  def edit #edit_book　投稿内容編集ページ
    @book = Book.find(params[:id])
  end

  def update 
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render("books/edit")
    end
  end

  def destroy 
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
