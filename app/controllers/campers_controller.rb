class CampersController < ApplicationController

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end

    def destroy
        Camper.destroy(params[:id])
        head :no_content
    end

    private

    def camper_params
params.permit(:name,:age)
    end



end
