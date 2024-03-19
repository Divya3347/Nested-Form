class BooksController < ApplicationController
  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)
    if @book.save
      redirect_to @author
    else
      redirect_to root_path
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    @book.destroy

    redirect_to @author
  end

  private
  def book_params
    params.require(:book).permit(:name,:price,:quantity)
  end
end
