class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿できました！succesfuliy created!"
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @book1 = Book.find(params[:id])
  end

  def update
    @book1 = Book.find(params[:id])
    if @book1.update(book_params)
      flash[:notice] = "編集できました！succesfuliy updated!"
      redirect_to book_path(@book1.id)
    else
      @book = Book.find(params[:id])
      render :edit
    end

  end

  def destroy
    book= Book.find(params[:id])
    book.destroy
    flash[:notice] = "削除できました！succesfuliy destroyed!"
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title , :body)
  end
end
