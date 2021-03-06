class BooksController < ApplicationController
  def index
  	@books = Book.page(params[:page]).reverse_order
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  # def create
  # 	@book = Book.new(book_params)
  # 	if @book.save
  # 	flash[:notice] = "You have creatad book successfully."
  # 	redirect_to books_path
  # else
  # 	flash[:notice] = "Please check feild!!"
  # 	render 'index'
  # end

 def create
  	if @book =Book.new(book_params)
  	@book.save
  	redirect_to books_path(@book.id)
  else
  	render 'new'
  end
 end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	@book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book)
  end


  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to index_path
  end

 private
	def book_params
      params.require(:book).permit(:title, :opinion)
    end

end
