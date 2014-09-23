require_dependency "mjweb/application_controller"

module Mjweb
  class BanksController < ApplicationController
    before_action :set_bank, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]
    
    def index
      @contents = Bank.where(:company_id => current_user.company_id)
      @content = Bank.new
    end

    def new
      @content = Bank.new
    end

    def edit
    end

    # POST /banks
    def create
      @bank = Bank.new(bank_params)

      if @bank.save
        redirect_to banks_path, notice: 'Bank was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /banks/1
    def update
      if @bank.update(bank_params)
        redirect_to banks_path, notice: 'Bank was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /banks/1
    def destroy
      @bank.destroy
      redirect_to banks_url, notice: 'Bank was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_bank
        @bank = Bank.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end
      
      # Only allow a trusted parameter "white list" through.
      def bank_params
        params.require(:bank).permit(:company_id, :title, :text, :link_text, :link_url, :image_id)
      end
  end
end
