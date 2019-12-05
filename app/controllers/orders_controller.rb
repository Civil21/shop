# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show update edit destroy state]

  def index
    @orders = if current_user.id == 1
                Order.all
              else
                current_user.orders
    end
  end

  def show; end

  def state
    @order.update(state: params[:state])
    redirect_back(fallback_location: root_path)
  end

  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
    redirect_back(fallback_location: root_path) if @product.nil?
  end

  def create
    @product = Product.find(params[:product_id])
    params[:order][:product_id] = @product.id
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to basket_path
    else
      render 'new'
    end
  end

  def updated
    if @order.update(order_params)
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  def destroy; end

  private

  def order_params
    params.require(:order).permit(:user_id, :product_id, :count)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order
    @order ||= Order.find(params[:id])
  end
end
