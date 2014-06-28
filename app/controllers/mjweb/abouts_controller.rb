require_dependency "mjweb/application_controller"

module Mjweb
  class AboutsController < ApplicationController
    before_action :set_about, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]

    # GET /abouts
    def index
      #filter by company subdmain      
      @abouts = About.where(:company_id => current_user.company_id)
    end

    # GET /abouts/new
    def new
      @about = About.new
    end

    # GET /abouts/1/edit
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
      if @about.update(about_params)
        redirect_to @about, notice: 'About was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /abouts/1
    def destroy
      @about.destroy
      redirect_to abouts_url, notice: 'About was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_about
        @about = About.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id).first 
      end

      # Only allow a trusted parameter "white list" through.
      def about_params
        params.require(:about).permit(:company_id, :title, :text, :image_id)
      end
  end
end
