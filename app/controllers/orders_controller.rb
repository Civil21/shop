# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = Order.new
    @product = Product.find_by_id(params[:product_id])
    redirect_back(fallback_location: root_path) if @product.nil?
  end

  def create; end

  def edit; end

  def updated; end

  def destroy; end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order
    @order ||= Order.find(params[:id])
  end
end
