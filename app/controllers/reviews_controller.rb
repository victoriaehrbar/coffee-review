class ReviewsController < ApplicationController

    def new
        if @coffee = Coffee.find_by_id(params[:coffee_id])
          @review = @coffee.reviews.build
        else
          @review = Review.new
        end
      end

    def index
    end

    private

    def review_params
        params.require(:review).permit(:ice_cream_id, :content, :stars, :title)
    end
    
end
