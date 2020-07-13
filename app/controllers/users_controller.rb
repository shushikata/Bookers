class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:create, :top]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def index 
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def create 
    @book = Book.new(book_params)
    @book.save 
    redirect_to book_path(@book.id)
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = 'You have updated book successfully.'
    else 
      @users = User.all
      render("users/edit")
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
       redirect_to user_path(current_user)
    end
  end

end
