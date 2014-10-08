require_dependency "mjweb/application_controller"

module Mjweb
  class AboutsController < ApplicationController
    before_action :set_about, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]

    def index
      @contents = About.where(:company_id => current_user.company_id)
      @content = About.new
    end

    def new
      @content = About.new
    end

    def edit
    end

    # POST /abouts
    def create
      @about = About.new(about_params)

      if @about.save
        redirect_to @about, notice: 'About was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /abouts/1
    def update
      if @content.update(about_params)
        redirect_to @about, notice: 'About was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /abouts/1
    def destroy
      @content.destroy
      redirect_to abouts_url, notice: 'About was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_about
        @content = About.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end


      # Only allow a trusted parameter "white list" through.
      def about_params
        params.require(:about).permit(:company_id, :title, :text, :link_url, :link_text, :image_id)
      end
  end
end
