require_dependency "mjweb/application_controller"

module Mjweb
  class HoursController < ApplicationController
    before_action :set_hour, only: [:show, :edit, :update, :destroy]


    # GET /hours/1/edit
    def edit
    end

    # PATCH/PUT /hours/1
    def update
      if @hour.update(hour_params)
        redirect_to contents_path, notice: 'Hours were successfully updated.'
      else
        render :edit
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_hour
        @hour = Hour.where(:company_id => params[:id]).first
      end

      # Only allow a trusted parameter "white list" through.
      def hour_params
        params.require(:hour).permit(:company_id, :monday_status, :monday_open, :monday_close, :tuesday_status, :tuesday_open, :tuesday_close, :wednesday_status, :wednesday_open, :wednesday_close, :thursday_status, :thursday_open, :thursday_close, :friday_status, :friday_open, :friday_close, :saturday_status, :saturday_open, :saturday_close, :sunday_status, :sunday_open, :sunday_close)
      end
  end
end
