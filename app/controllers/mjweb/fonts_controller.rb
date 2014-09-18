require_dependency "mjweb/application_controller"

module Mjweb
  class FontsController < ApplicationController


    def index
      @fonts = Font.all
    end


    def new
      @font = Font.new
    end


    def create
      @font = Font.new(image_params)

      if @font.save
        redirect_to fonts_path, notice: 'Font was successfully uploaded.'
      else
        render :new
      end
    end


    def destroy
      @font = Font.find(params[:id])
      @font.destroy
      redirect_to fonts_url, notice: 'Font was successfully deleted.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:font).permit(:name, :style, :font)
      end
  end
end
