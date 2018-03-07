class ProductLinksController < ApplicationController
  before_action :require_login
  before_action :set_product_link, only: [:show, :edit, :update, :destroy]

  def new
    @product_link = ProductLink.new(product_id: params[:product_id])
  end

  def edit
  end

  def create
    @product_link = ProductLink.new(product_link_params)
    if @product_link.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    if @product_link.update(product_link_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product_link.destroy
    redirect_to products_path
  end

  private
    def set_product_link
      @product_link = ProductLink.find(params[:id])
    end

    def product_link_params
      params.require(:product_link).permit(:name, :url, :product_id)
    end
end
