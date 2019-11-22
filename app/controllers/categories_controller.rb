# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_name(params[:id])
    @products = @category.products
  end

  def index
    @categories = Category.all
  end
end
