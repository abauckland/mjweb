require_dependency "mjweb/application_controller"

module Mjweb
  class TrainingsController < ApplicationController
    before_action :set_training, only: [:edit, :update, :destroy]
    before_action :get_images, only: [:new, :edit]
    
    def index
      @contents = Training.where(:company_id => current_user.company_id)
      @content = Training.new
    end

    def new
      @content = Training.new
    end

    def edit
    end

    # POST /trainings
    def create
      @training = Training.new(training_params)

      if @training.save
        redirect_to traininga_path, notice: 'Training was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /trainings/1
    def update
      if @training.update(training_params)
        redirect_to trainings_path, notice: 'Training was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /trainings/1
    def destroy
      @training.destroy
      redirect_to trainings_url, notice: 'Training was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_training
        @training = Training.find(params[:id])
      end
      
      def get_images
        @images = Mjweb::Image.where(:company_id => current_user.company_id)
      end
      
      # Only allow a trusted parameter "white list" through.
      def training_params
        params.require(:training).permit(:company_id, :title, :text, :link_text, :link_url, :image_id)
      end
  end
end
