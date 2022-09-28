class PlantsController < ApplicationController
    # GET /plants
    def index
        plants = Plant.all
        render json: plants
    end
    
    # GET /plants/:id
    def show
        plant = Plant.findby(:id params[:id])
        if plant
            render json: plant
        else
            render json: { error: "Plant not found" }, status: not found
        end
    end

    # POST /plants
    def create
        plant = Plant.create(name: params[:name], image: params[:image], price: params[:price])
        render json: plant, status: 'success'
    end
end
