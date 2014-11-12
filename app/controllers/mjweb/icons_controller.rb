require_dependency "mjweb/application_controller"

module Mjweb
  class IconsController < ApplicationController


    def index
      @icons = Icon.all
      authorize @icons
    end


    def new
      @icon = Icon.new
      authorize @icon
    end


    def create
      @icon = Icon.new(icon_params)
      authorize @icon
      if @icon.save
        redirect_to icons_path, notice: 'Icon was successfully uploaded.'
      else
        render :new
      end
    end


    def destroy
      @icon = Icon.find(params[:id])
      authorize @icon
      @icon.destroy
      redirect_to icons_url, notice: 'Icon was successfully deleted.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def icon_params
        params.require(:icon).permit(:name, :icon)
      end
  end
end
