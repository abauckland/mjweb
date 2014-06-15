require_dependency "mjweb/application_controller"

module Mjweb
  class ImagesController < ApplicationController

    # GET /images
    def index
      @images = Image.where(:company_id => current_user.company_id)
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
      @image = Image.find(params[:id])
      redirect_to images_url, notice: 'Image was successfully destroyed.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit(:company_id, :name, :photo)
      end
  end
end
