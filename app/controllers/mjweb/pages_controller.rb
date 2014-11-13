require_dependency "mjweb/application_controller"

module Mjweb
  class PagesController < ApplicationController

    skip_before_filter :authenticate_user!, :only => [:show]

    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
      @pages = policy_scope(Page)
    end

    def show
      @infos = Info.where(:page_id => params[:id]).order('mjweb_infos.order_ref')

      @design = Mjweb::Design.where(:company_id => @page.company_id).first
      @detail = Mjweb::Detail.where(:company_id => @page.company_id).first
      colour_settings(@design.tile_colour) 

      
      render layout: "mjweb/layouts/website"       
    end

    def new
      @page = Page.new
    end

    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to pages_path, notice: 'page was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to pages_path, notice: 'page was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to pages_url, notice: 'page was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end


      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:company_id, :name)
      end
  end
end
