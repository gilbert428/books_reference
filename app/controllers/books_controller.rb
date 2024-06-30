# app/controllers/books_controller.rb
class BooksController < ApplicationController
  def index
    if params[:q]
      @books = Book.where('title LIKE ?', "%#{params[:q]}%").page(params[:page])
    else
      @books = Book.page(params[:page])
    end
  end
  def show
    @book = Book.find(params[:id])
  end
end
