class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new()
  end

  def create
    @product = Product.new(product_param)
    if @product.save
      MemberProduct.create(member: current_member, product: @product)
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_param)
      redirect_to products_path
    else
      render :new
    end

  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_param
      p = params.require(:product).permit(:name, :genre, :price, :start_at, :end_at, :slogan, :describe, :icon_url, :movie_url)
      md = p[:movie_url].match(/https:\/\/youtu.be\/(.+)/)
      if !md.nil? then p[:movie_url] = "https://www.youtube.com/embed/#{md[1]}" end
      p
    end
end
