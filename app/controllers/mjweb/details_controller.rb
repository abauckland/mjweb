require_dependency "mjweb/application_controller"

module Mjweb
  class DetailsController < ApplicationController
    before_action :set_detail, only: [:edit, :update]


    # GET /details/1/edit
    def edit
    end

    # PATCH/PUT /details/1
    def update
      if @detail.update(detail_params)
        render :edit, notice: 'Detail was successfully updated.'
      else
        render :edit
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_detail
        @detail = Detail.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def detail_params
        params.require(:detail).permit(:company_id, :tagline, :monday_open, :monday_close, :tuesday_open, :tuesday_close, :wednesday_open, :wednesday_close, :thursday_open, :thursday_close, :friday_open, :friday_close, :saturday_open, :saturday_close, :sunday_open, :sunday_close, :ecommerce, :facebook, :twitter, :googleplus, :linkedin)
      end
  end
end
