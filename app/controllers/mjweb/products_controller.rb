require_dependency "mjweb/application_controller"

module Mjweb
  class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]

    def index
      @contents = Product.where(:company_id => current_user.company_id)
      @content = Product.new
    end

    def new
      @content = Product.new
    end

    def edit
    end

    # POST /products
    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /products/1
    def update
      if @content.update(product_params)
        redirect_to products_path, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /products/1
    def destroy
      @content.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @content = Product.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end
      
      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:company_id, :title, :text, :link_text, :link_url, :image_id)
      end
  end
end
