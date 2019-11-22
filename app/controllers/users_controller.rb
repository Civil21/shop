# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def show
    redirect_to my_path if user_signed_in? && @user.id == current_user.id
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
