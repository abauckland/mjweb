require_dependency "mjweb/application_controller"

module Mjweb
  class LinktilesController < ApplicationController

    def edit
      @linktile = Linktile.where(:content_id => params[:id]).first
      if @linktile.nil?
        @linktile = Linktile.create(:content_id => params[:id], :icon_id => 1)
      end
    end


    def edit_detail
      @linktile = Linktile.where(:id => params[:id]).first
      
      if @linktile.type_id == 3 || @linktile.type_id == 4
        6.times { @linktile.tilelists.build }
      end 
      
      if @linktile.type_id == 2 || @linktile.type_id == 3      
        @pages = policy_scope(Page)
      end
      
    end



    # PATCH/PUT /pages/1
    def update
      @linktile = Linktile.where(:id => params[:id]).first
      if @linktile.update(linktile_params)        
        if params[:type_id]        
          @linktile.update(:type_id => params[:type_id])
        end
        redirect_to edit_detail_linktile_path(:id => @linktile.id), notice: 'Tile details were successfully updated.'
      else
        render :edit
      end
    end


    private
      # Only allow a trusted parameter "white list" through.
      def linktile_params
        params.require(:linktile).permit(:content_id, :title, :icon_id, :page_id, :link_url, :type_id, :tilelists_attributes => [:text])
      end
  end
end
