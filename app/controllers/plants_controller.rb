class PlantsController < ApplicationController
    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "Plany not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(params.permit(:image, :price, :name))
        render json: plant, status: :ok
    end
end
