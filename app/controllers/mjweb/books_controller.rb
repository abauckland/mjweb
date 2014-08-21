require_dependency "mjweb/application_controller"

module Mjweb
  class BooksController < ApplicationController
    before_action :set_account, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]
    
    # GET /books
    def index
      @books = Book.where(:company_id => current_user.company_id)
    end

    # GET /books/new
    def new
      @book = Book.new
    end

    # GET /books/1/edit
    def edit
    end

    # POST /books
    def create
      @book = Book.new(account_params)

      if @book.save
        redirect_to books_path, notice: 'Account was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /books/1
    def update
      if @book.update(book_params)
        redirect_to books_path, notice: 'Account was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /books/1
    def destroy
      @book.destroy
      redirect_to books_url, notice: 'Account was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end
      
      # Only allow a trusted parameter "white list" through.
      def account_params
        params.require(:book).permit(:company_id, :title, :text, :link_text, :link_url, :image_id)
      end
  end
end
