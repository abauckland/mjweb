require_dependency "mjweb/application_controller"

module Mjweb
  class ImagesettingsController < ApplicationController
    before_action :set_content, only: [:list, :show]
    
    # GET /images
    def list
      @imagesettings = Imagesetting.where(:content_id => @content.id)
    end
    
    def show
      @imagesetting = Imagesetting.where(:content_id => @content.id).first
    end

    # GET /images/new
    def new
      @imagesetting = Imagesetting.new
      @images = Mjweb::Image.where(:company_id => current_user.company_id)
      @content = Content.find(params[:content_id])
    end

    # POST /images
    def create
      @imagesetting = Imagesetting.new(image_params)

      if @imagesetting.save
        if @imagesetting.content.tile_id == 14
          redirect_to imagesetting_path(:id => @imagesetting.content_id), notice: 'Image was successfully added.'
        else
          redirect_to list_imagesetting_path(:id => @imagesetting.content_id), notice: 'Image was successfully added.'
        end
      else
        render :new
      end
    end

    # DELETE /images/1
    def destroy
      @imagesetting = Imagesetting.find(params[:id])
      tile_id = @imagesetting.content.tile_id      
      @imagesetting.destroy
      if tile_id == 14
        redirect_to imagesetting_path(:id => @imagesetting.content_id), notice: 'Image was successfully removed.'
      else
        redirect_to list_imagesetting_path(:id => @imagesetting.content_id), notice: 'Image was successfully removed.'
      end
    end

    private
      def set_content
        @content = Content.find(params[:id])
      end
    
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:imagesetting).permit(:content_id, :image_id)
      end
  end
end
