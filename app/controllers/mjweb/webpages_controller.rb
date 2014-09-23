require_dependency "mjweb/application_controller"

module Mjweb
  class WebpagesController < ApplicationController
    before_action :set_webpage, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]
    
    def index
      @contents = Webpage.where(:company_id => current_user.company_id)
      @content = Webpage.new
    end

    def new
      @content = Webpage.new
    end

    def edit
    end

    # POST /webpages
    def create
      @webpage = Webpage.new(webpage_params)

      if @webpage.save
        redirect_to webpages_path, notice: 'Webpage was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /webpages/1
    def update
      if @webpage.update(webpage_params)
        redirect_to webpages_path, notice: 'Webpage was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /webpages/1
    def destroy
      @webpage.destroy
      redirect_to webpages_url, notice: 'Webpage was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_webpage
        @webpage = Webpage.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end
      
      # Only allow a trusted parameter "white list" through.
      def webpage_params
        params.require(:webpage).permit(:company_id, :title, :text, :link_text, :link_url, :image_id)
      end
  end
end
