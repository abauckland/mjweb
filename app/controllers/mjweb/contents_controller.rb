require_dependency "mjweb/application_controller"

module Mjweb
  class ContentsController < ApplicationController
    before_action :set_content, only: [:show, :edit, :update, :destroy]
    before_action :set_tiles, only: [:new, :edit]

    # GET /contents
    def index
      @contents = Content.where(:company_id => current_user.company_id)
    end

    # GET /contents/1
    def show
    end

    # GET /contents/new
    def new
      @content = Content.new
    end

    # GET /contents/1/edit
    def edit
    end

    # POST /contents
    def create
      @content = Content.new(content_params)

      if @content.save
        redirect_to contents_path, notice: 'content was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /contents/1
    def update
      if @content.update(content_params)
        redirect_to contents_path, notice: 'content was successfully created.'
      else
        render :edit
      end
    end

    # DELETE /contents/1
    def destroy
      @content.destroy
      redirect_to contents_url, notice: 'Tile was successfully deleted.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_content
        @content = Content.find(params[:id])
      end

      def set_tiles
        @tiles = Mjweb::Tile.all
      end

      # Only allow a trusted parameter "white list" through.
      def content_params
        params.require(:content).permit(:company_id, :tile_id, :order, :display, :link)
      end

  end
end
