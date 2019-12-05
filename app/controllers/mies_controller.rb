# frozen_string_literal: true

class MiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @products = Product.all
  end

  def update
    # @user.attributes = user_params
    @user.update_attributes(user_params)
    redirect_to my_path
  end

  def edit; end

  def personal; end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:city, :name)
  end
end
