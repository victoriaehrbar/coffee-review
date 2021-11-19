class CoffeesController < ApplicationController

    def new
        @coffee = Coffee.new
        @coffee.build_brand
    end

    private

    def coffee_params
      params.require(:coffee).permit(:name, :roast_type, :description, :brand_id, brand_attributes: [:name])
    end
end
