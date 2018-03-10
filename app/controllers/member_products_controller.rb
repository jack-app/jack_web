class MemberProductsController < ApplicationController
  before_action :require_login
  before_action :set_member_product, only: [:show, :edit, :update, :destroy]

  def new
    @member_product = MemberProduct.new(product_id: params[:product_id])
  end

  def create
    @member_product = MemberProduct.new(member_product_param)
    if @member_product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @member_product.destroy
    redirect_to products_path
  end

  private
  def set_member_product
    @member_product = MemberProduct.find(params[:id])
  end
  def member_product_param
    params.require(:member_product).permit(:member_id, :product_id)
  end
end
