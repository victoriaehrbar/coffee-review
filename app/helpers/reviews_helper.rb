module ReviewsHelper

    def display_header(review)
      if params[:coffee_id]
          content_tag(:h1, "Add a review for #{review.coffee.name} -  #{review.coffee.brand.brand_name}")
      else
        content_tag(:h1, "Create review")
      end
    end
  end