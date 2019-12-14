# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def sort
    pp sort_name = params[:name]
    session['sort_type'] = if session['sort_name'] == sort_name && session['sort_type'] != 'ASC'
                             'ASC'
                           else
                             'DESC'
                            end
    if %w[name created_at price].include?(sort_name)
      session['sort_name'] = sort_name
    end
    redirect_back(fallback_location: root_path)
  end

  # GET /products
  # GET /products.json
  def index
    @products = if params[:q].present?
                  Product.where('name LIKE ?', "%#{params[:q]}%")
                else
                  Product.all
      end

    unless session['sort_name'].nil?
      @products = @products.order("#{session['sort_name']} #{session['sort_type']}")
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    if current_user.id == 1
      @product = Product.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  # GET /products/1/edit
  def edit
    redirect_back(fallback_location: root_path) unless current_user.id == 1
  end

  # POST /products
  # POST /products.json
  def create
    # all_tags = params[:all_tags]
    if current_user.id == 1
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          # @product.all_tags = all_tags
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :index }
        # format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if current_user.id == 1
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :index }
        # format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if current_user.id == 1
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { render :index }
        # format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :desc, :all_tags, :price, images: [])
  end
end
