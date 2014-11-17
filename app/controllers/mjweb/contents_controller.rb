require_dependency "mjweb/application_controller"

module Mjweb
  class ContentsController < ApplicationController
    before_action :set_content, only: [:show, :edit, :update, :destroy, :move_up, :move_down]
    before_action :set_tiles, only: [:new, :edit]

    # GET /contents
    def index
      @contents = policy_scope(Content).order(:tile_ref)
    end

    # GET /contents/1
    def show
    end

    # GET /contents/new
    def new
      @content = Content.new
      
      tile_count = policy_scope(Content).count
      @tile_ref = tile_count + 1
      
      
#      if current_user.company.has_store?
#        @tiles = Mjweb::Tile.where.not(:id => 10)
#      else
        @tiles = Mjweb::Tile.all
#      end   
      
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
      if @content.tile_ref >= 2
        above_row = policy_scope(Content).where(:tile_ref => (@content.tile_ref - 1)).first      
        above_row.update(:tile_ref => @content.tile_ref)
        @content.update(:tile_ref => @content.tile_ref - 1)
      end
      redirect_to contents_path, notice: 'Tile moved up.'      
    end

    def move_down
      
      tile_count = policy_scope(Content).count
            
      if @content.tile_ref != tile_count
        next_row = policy_scope(Content).where(:tile_ref => (@content.tile_ref + 1)).first      
        next_row.update(:tile_ref => @content.tile_ref)
        @content.update(:tile_ref => @content.tile_ref + 1)
      end
      redirect_to contents_path, notice: 'Tile moved down.'    
    end

    # DELETE /contents/1
    def destroy
      
      @content.destroy
      
      @contents = policy_scope(Content).order('tile_ref')
      @contents.each_with_index do |content, i|
        content.update(:tile_ref =>  i+1)
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
