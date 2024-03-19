class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    2.times { @author.books.build }
    # @author.books.build
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if  @author.update(author_params)
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to root_path
  end

  private
  def author_params
    params.require(:author).permit(:name,:age ,books_attributes: [:id, :name , :price , :quantity])
  end
end
