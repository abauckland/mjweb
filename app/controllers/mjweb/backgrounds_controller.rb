require_dependency "mjweb/application_controller"

module Mjweb
  class BackgroundsController < ApplicationController


    def index
      @backgrounds = Background.all
    end


    def new
      @background = Background.new
    end


    def create
      @background = Background.new(image_params)

      if @background.save
        redirect_to backgrounds_path, notice: 'Background was successfully uploaded.'
      else
        render :new
      end
    end

    def destroy
      @background = Background.find(params[:id])
      @background.destroy
      redirect_to backgrounds_url, notice: 'Background was successfully deleted.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:background).permit(:name, :background)
      end
  end
end
