require_dependency "mjweb/application_controller"

module Mjweb
  class InfosController < ApplicationController
    before_action :set_info, only: [:show, :edit, :update, :destroy, :move_up, :move_down]
    before_action :get_images, only: [:new, :edit, :update, :create]
    before_action :get_pages, only: [:new, :edit, :update, :create]

    def index
      @infos = Info.where(:page_id => params[:id]).order('order_ref')
      @page = Page.find(params[:id])
    end

    def show

    end

    def new
      
      @info = Info.new

      info_count = Info.where(:page_id => params[:page_id]).count
      @order_ref = info_count + 1

      @page_id = params[:page_id]

    end

    def edit
      @order_ref = @info.order_ref
      @page_id = @info.page_id
    end

    # POST /infos
    def create
      @info = Info.new(info_params)

      if @info.save
        redirect_to infos_path(:id => @info.page_id), notice: 'Information was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /infos/1
    def update

      if @info.update(info_params)
        redirect_to infos_path(:id => @info.page_id), notice: 'Information was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /infos/1
    def destroy
      
      page_id = @info.page_id

      @info.destroy

      @infos = Info.where(:page_id => page_id).order('order_ref')
      @infos.each_with_index do |info, i|
        info.update(:order_ref =>  i+1)
      end

      redirect_to infos_path(:id => @info.page_id), notice: 'info was successfully destroyed.'
    end

    def move_up
      if @info.order_ref >= 2
        above_row = Info.where(:page_id => @info.page_id, :order_ref => (@info.order_ref - 1)).first
        above_row.update(:order_ref => @info.order_ref)
        @info.update(:order_ref => (@info.order_ref - 1))
      end
      redirect_to infos_path(:id => @info.page_id), notice: 'Item was successfully moved up.'
    end

    def move_down
      info_count = Info.where(:page_id => params[:page_id]).count

      if @info.order_ref != info_count
        next_row = Info.where(:page_id => @info.page_id, :order_ref => (@info.order_ref + 1)).first
        next_row.update(:order_ref => @info.order_ref)
        @info.update(:order_ref => (@info.order_ref + 1))
      end
      redirect_to infos_path(:id => @info.page_id), notice: 'Tile was successfully moved down.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_info
        @info = Info.find(params[:id])
      end

      def get_images
        @images = policy_scope(Image)
      end

      def get_pages
        @pages = policy_scope(Page)
      end

      # Only allow a trusted parameter "white list" through.
      def info_params
        params.require(:info).permit(:order_ref, :page_id, :title, :text, :link_type, :link_url, :link_text, :link_page_id, :image_id)
      end
  end
end
