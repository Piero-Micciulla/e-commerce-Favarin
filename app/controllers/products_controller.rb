class ProductsController < ApplicationController
  before_action :find_products, except: [:dashboard, :create, :index, :new]

  def dashboard
    @shops = Shop.all
    @products = Product.all
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(strong_params)
    @product.shop = current_user.shop
    if @product.save
      redirect_to dashboard_url, notice: 'product created'
    else
      render dashboard_url, notice: 'something went wrong'
    end
  end

  def edit
    @product
  end

  def update
    @product
    if @product.update(strong_params)
      redirect_to dashboard_url, notice: 'product updated'
    else
      render dashboard_url, notice: 'something went wrong'
    end
  end

  def destroy
    @product.destroy
    render dashboard_url, notice: 'product deleted'
  end

  private

  def strong_params
    params.require(:product).permit(:price_per_unit, :reference_number, :category, :sold_status)
  end

  def find_products
    @product = Product.find(params[:id])
  end
end
