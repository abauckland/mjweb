require_dependency "mjweb/application_controller"

module Mjweb
  class DesignsController < ApplicationController

    # GET /details/1/edit
    def edit
      @design = Design.where(:company_id => params[:id]).first
    end

    # PATCH/PUT /details/1
    def update
      @design = Design.where(:id => params[:id]).first
      respond_to do |format|
        if @design.update(design_params)
          format.html { redirect_to contents_path, notice: 'Design settings were successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @design.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Only allow a trusted parameter "white list" through.
      def design_params
        params.require(:design).permit(:company_id, :tile_colour, :background_id, :font_id)
      end
  end
end
