#require_dependency "mjweb/application_controller"
require 'colorist'
include Colorist

module Mjweb
  class WebsitesController < ApplicationController

    skip_before_filter :authenticate_user!, :only => [:index, :event, :plan]

    before_action :set_company
    before_action :set_detail
    before_action :set_design
    
    # GET /websites
    # GET /websites.json
    def index
      @contents = Mjweb::Content.where(:company_id => @sub_company.id).order('tile_ref')
      @design = Mjweb::Design.where(:company_id => @sub_company.id).first
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def event
      @company = Company.where(:id => @sub_company.id).first
      @events = Mjweb::Event.where(:company_id => @sub_company.id).order('id')
      colour_settings(@design.tile_colour) 
      
      render layout: "mjweb/layouts/website"      
    end

    def plan
  
    end
                      
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_website
       # @website = Website.find(params[:id])
      end

      def set_design
        set_company
        @design = Mjweb::Design.where(:company_id => @sub_company.id).first
      end

      def set_detail
        set_company
        @detail = Mjweb::Detail.where(:company_id =>  @sub_company.id).first
      end
  
  end
end

