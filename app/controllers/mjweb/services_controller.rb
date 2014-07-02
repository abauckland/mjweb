require_dependency "mjweb/application_controller"

module Mjweb
  class ServicesController < ApplicationController
    before_action :set_service, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]
    
    # GET /services
    def index
      #filter by company subdmain
      @services = Service.where(:company_id => current_user.company_id)
    end

    # GET /services/new
    def new
      @service = Service.new
    end

    # GET /services/1/edit
    def edit
    end

    # POST /services
    def create
      @service = Service.new(service_params)

      if @service.save
        redirect_to services_path, notice: 'Service was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /services/1
    def update
      if @service.update(service_params)
        redirect_to services_path, notice: 'Service was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /services/1
    def destroy
      @service.destroy
      redirect_to services_url, notice: 'Service was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_service
        @service = Service.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end

      # Only allow a trusted parameter "white list" through.
      def service_params
        params.require(:service).permit(:company_id, :title, :text, :link, :image_id)
      end
  end
end
