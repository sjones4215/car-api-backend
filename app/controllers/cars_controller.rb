class CarsController < ApplicationController
    before_action :set_car, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    def index
        @cars = Car.all
        render json: { cars: @cars, reviews: @reviews }
    end

    def show
        render json: { cars: @car, reviews: @reviews }
    end
    
    def create
        @car = Car.new(car_params)
        if @car.save
            render json: @car, status: :created
        else
            render json: @car.errors, status: :unprocessable_entity
        end
    end

    def update 
        if @car.update(car_params)
            render json: @car, status: :created
        else
            render json: @car.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @car.destroy
    end

    private

    def set_car
        @car = Car.find(params[:id])
    end

    def car_params
        params.require(:car).permit(:year, :make, :model, :color, :price, :image, :description, :info)
    end

end
