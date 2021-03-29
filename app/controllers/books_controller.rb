class BooksController < ApplicationController

    def index
      @books = Book.all
      @book = Book.new
      @user = current_user
    end

    def create
      @books = Book.all #for validates
      @user = current_user #for validates
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        render :index
      end
    end

    def show
      @book = Book.find(params[:id])
      @booknew = Book.new
      @user = @book.user
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end

    def edit
      @book = Book.find(params[:id])
      if
        @book.user == current_user
      else
        redirect_to user_path(current_user)
      end
    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated book successfully"
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    end




    private

    def book_params
      params.require(:book).permit(:title, :body)
    end

end
