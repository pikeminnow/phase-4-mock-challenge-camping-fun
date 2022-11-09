class ActivitiesController < ApplicationController

    def index
        render json: Activity.all, status: :ok
    end

    def show
        activity = Activity.find(params[:id])
        render json: activity, status: :ok
    end

    def destroy
        Activity.destroy(params[:id])
        head :no_content
    end

end
