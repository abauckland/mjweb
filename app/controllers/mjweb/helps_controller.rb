require_dependency "mjweb/application_controller"

module Mjweb
  class HelpsController < ApplicationController
    before_action :set_help, only: [:show, :update]

    # GET /helps/1
    def show
      render :text=> @help.text 

    end

    # GET /helps/1/edit
    def edit
      if current_user.companyy_id == 1
        @help = Help.find_by_id(params[:id]) || Help.create(:id => params[:id])
      end
    end

    # PATCH/PUT /helps/1
    def update
      if @help.update(help_params)
#on create redirect back to dashbard
        redirect_to @help, notice: 'Help was successfully updated.'
      else
        render :edit
      end
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_help
        @help = Help.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def help_params
        params.require(:help).permit(:id, :text)
      end
  end
end