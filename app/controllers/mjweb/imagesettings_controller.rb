require_dependency "mjweb/application_controller"

module Mjweb
  class ImagesettingsController < ApplicationController
    before_action :set_content, only: [:list]
    
    # GET /images
    def list
      @imagesettings = Imagesettings.where(:content_id => @content.id)
    end

    # GET /images/new
    def new
      @imagesetting = Imagesettings.new
      @images = Mjweb::Images.where(:company_id => current_user.company_id)
    end

    # POST /images
    def create
      @imagesetting = Imagesettings.new(image_params)

      if @image.save
        redirect_to @imagesetting, notice: 'Image was successfully added.'
      else
        render :new
      end
    end

    # DELETE /images/1
    def destroy
      @imagesetting = Imagesetting.find(params[:id])
      redirect_to images_url, notice: 'Image was successfully removed.'
    end

    private
      def set_content
        @content = Content.find(params[:content_id])
      end
    
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:imagesetting).permit(:content_id, :image_id)
      end
  end
end
