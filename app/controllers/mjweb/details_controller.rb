require_dependency "mjweb/application_controller"

module Mjweb
  class DetailsController < ApplicationController
    before_action :set_detail, only: [:show, :edit, :update, :destroy]

    # GET /details
    def index
      @details = Detail.all
    end

    # GET /details/1
    def show
    end

    # GET /details/new
    def new
      @detail = Detail.new
    end

    # GET /details/1/edit
    def edit
    end

    # POST /details
    def create
      @detail = Detail.new(detail_params)

      if @detail.save
        redirect_to @detail, notice: 'Detail was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /details/1
    def update
      if @detail.update(detail_params)
        redirect_to @detail, notice: 'Detail was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /details/1
    def destroy
      @detail.destroy
      redirect_to details_url, notice: 'Detail was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_detail
        @detail = Detail.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def detail_params
        params.require(:detail).permit(:company_id, :tile_colour, :tagline, :ecommerce, :facebook, :twitter, :googleplus, :linkedin)
      end
  end
end
