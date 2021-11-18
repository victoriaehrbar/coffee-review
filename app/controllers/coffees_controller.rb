class CoffeesController < ApplicationController

    def new
        @coffee = Coffee.new
    end
end
