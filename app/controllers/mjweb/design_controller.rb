require_dependency "mjweb/application_controller"

module Mjweb
  class DesignController < ApplicationController
    before_action :set_design, only: [:edit, :update]


    # GET /details/1/edit
    def edit
    end

    # PATCH/PUT /details/1
    def update
      if @design.update(design_params)
        render :edit, notice: 'Detail was successfully updated.'
      else
        render :edit
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_design
        @design = Design.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def design_params
        params.require(:design).permit(:tile_colour, :background, :font)
      end
  end
end
