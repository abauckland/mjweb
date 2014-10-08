require_dependency "mjweb/application_controller"

module Mjweb
  class DetailsController < ApplicationController

    # GET /details/1/edit
    def edit
      @detail = Detail.where(:company_id => params[:id]).first
    end

    # PATCH/PUT /details/1
    def update
      @detail = Detail.where(:id => params[:id]).first
      respond_to do |format|
        if @detail.update(detail_params)
          format.html { redirect_to contents_path, notice: 'Company details were successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @detail.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Only allow a trusted parameter "white list" through.
      def detail_params
        params.require(:detail).permit(:company_id, :tagline, :facebook, :twitter, :googleplus, :linkedin)
      end
  end
end