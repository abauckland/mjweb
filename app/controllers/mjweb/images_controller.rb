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
        redirect_to images_path, notice: 'Image was successfully uploaded.'
      else
        render :new
      end
    end

    # DELETE /images/1
    def destroy
      @image = Image.find(params[:id])
	@image.destroy
      redirect_to images_url, notice: 'Image was successfully deleted.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit(:company_id, :name, :image)
      end
  end
end
