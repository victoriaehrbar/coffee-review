class CoffeesController < ApplicationController

    def new
        @coffee = Coffee.new
        @coffee.build_brand
    end
end
