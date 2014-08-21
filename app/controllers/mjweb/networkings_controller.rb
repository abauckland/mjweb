require_dependency "mjweb/application_controller"

module Mjweb
  class NetworkingsController < ApplicationController
    before_action :set_networking, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]
    
    # GET /networkings
    def index
      @networkings = Networking.where(:company_id => current_user.company_id)
    end

    # GET /networkings/new
    def new
      @networking = Networking.new
    end

    # GET /networkings/1/edit
    def edit
    end

    # POST /networkings
    def create
      @networking = Networking.new(networking_params)

      if @networking.save
        redirect_to networkings_path, notice: 'Networking was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /networkings/1
    def update
      if @networking.update(networking_params)
        redirect_to networkings_path, notice: 'Networking was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /networkings/1
    def destroy
      @networking.destroy
      redirect_to networkings_url, notice: 'Networking was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_networking
        @networking = Networking.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end
      
      # Only allow a trusted parameter "white list" through.
      def networking_params
        params.require(:networking).permit(:company_id, :title, :text, :link_text, :link_url, :image_id)
      end
  end
end
