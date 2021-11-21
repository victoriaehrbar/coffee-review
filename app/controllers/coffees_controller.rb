class CoffeesController < ApplicationController
    before_action :set_coffee, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def new
        @coffee = Coffee.new
        @coffee.build_brand
    end

    def create
        @coffee = Coffee.new(coffee_params)
        @coffee.user_id = session[:user_id]
        if @coffee.save
            redirect_to coffee_path(@coffee)
        else
            @coffee.build_brand
            render :new
        end
    end

    def index
        @coffees = Coffee.order_by_score.includes(:brand_name)
    end

    def show
        # @coffee = Coffee.find_by_id(params[:id])
    end

    def edit
    end

    def update
        if @coffee.update(coffee_params)
            redirect_to coffee_path(@coffee)
        else
            render :edit
        end
    end

    private

    def coffee_params
      params.require(:coffee).permit(:name, :roast_type, :description, :brand_id, brand_attributes: [:brand_name])
    end

    def set_coffee
        @coffee = Coffee.find_by(params[:id])
        redirect_to coffee_path if !@coffee
    end
end
