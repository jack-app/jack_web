class SnsLinksController < ApplicationController
  before_action :require_login
  before_action :set_sns_link, only: [:edit, :update, :destroy]
  def new
    @sns_link = SnsLink.new
  end

  def create
    if current_member.sns_links.create(sns_link_param)
      redirect_to member_path(current_member.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sns_link.update_attributes(sns_link_param)
      redirect_to member_path(current_member.id)
    else
      render :new
    end
  end

  def destroy
    @sns_link.destroy
    redirect_to member_path(current_member.id)
  end

  private
  def set_sns_link
    @sns_link = Skill.find_by(id: params[:id])
  end
  def sns_link_param
    params.require(:sns_link).permit(:name, :url)
  end
end
