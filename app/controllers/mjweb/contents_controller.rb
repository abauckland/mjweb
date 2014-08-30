require_dependency "mjweb/application_controller"

module Mjweb
  class ContentsController < ApplicationController
    before_action :set_content, only: [:show, :edit, :update, :destroy, :move_up, :move_down]
    before_action :set_tiles, only: [:new, :edit]

    # GET /contents
    def index
      @contents = Content.where(:company_id => current_user.company_id).order(:tile_ref)
    end

    # GET /contents/1
    def show
    end

    # GET /contents/new
    def new
      @content = Content.new
      
      tile_count = Content.where(:company_id => current_user.company_id).count
      @tile_ref = tile_count + 1
    end

    # GET /contents/1/edit
    def edit
    end

    # POST /contents
    def create
      @content = Content.new(content_params)

      if @content.save
        redirect_to contents_path, notice: 'Tile was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /contents/1
    def update
      if @content.update(content_params)
        redirect_to contents_path, notice: 'Tile was successfully created.'
      else
        render :edit
      end
    end

    def move_up            
      if @content.tile_ref >= 1
        above_row = Content.where(:tile_ref => (@content.tile_ref - 1), :company_id => @content.company_id).first      
        above_row.update(:tile_ref => @content.tile_ref)
        @content.update(:tile_ref => @content.tile_ref - 1)
      end
      redirect_to contents_path, notice: 'Tile moved up.'      
    end

    def move_down
      
      tile_count = Content.where(:company_id => @content.company_id).count
            
      if @content.tile_ref != tile_count
        next_row = Content.where(:tile_ref => (@content.tile_ref + 1), :company_id => @content.company_id).first      
        next_row.update(:tile_ref => @content.tile_ref)
        @content.update(:tile_ref => @content.tile_ref + 1)
      end
      redirect_to contents_path, notice: 'Tile moved down.'    
    end

    # DELETE /contents/1
    def destroy
      
      @content.destroy
      
      @tiles = Content.where(:company_id => @content.company_id).order(:tile_ref)
      @tiles.each_with_index do |tile, i|
        tile.update(:tile_ref =>  i+1)
      end
           
      redirect_to contents_url, notice: 'Tile was successfully deleted.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_content
        @content = Content.find(params[:id])
      end

      def set_tiles
        group = current_user.company.plan
        case group      
          when 1 ; @tiles = Mjweb::Tile.all
          when 2 ; @tiles = Mjweb::Tile.where(:group => 2)
          when 3 ; @tiles = Mjweb::Tile.where(:group => [2, 3])            
        end  
        
      end

      # Only allow a trusted parameter "white list" through.
      def content_params
        params.require(:content).permit(:company_id, :tile_id, :tile_ref, :display)
      end

  end
end
