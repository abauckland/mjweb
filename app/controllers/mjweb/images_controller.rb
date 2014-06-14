require_dependency "mjweb/application_controller"

module Mjweb
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]

    # GET /images
    def index
      @images = Image.all
    end

    # GET /images/new
    def new
      @image = Image.new
    end

    # POST /images
    def create
      @image = Image.new(image_params)

      if @image.save
        redirect_to @image, notice: 'Image was successfully created.'
      else
        render :new
      end
    end

    # DELETE /images/1
    def destroy
      @image.destroy
      redirect_to images_url, notice: 'Image was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Image.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit(:company_id, :photo)
      end
  end
end
