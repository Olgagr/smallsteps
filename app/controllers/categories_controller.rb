class CategoriesController < ApplicationController

  def index
    render json: Category.where(Category.arel_table[:name].matches("#{params[:query]}%"))
  end

end