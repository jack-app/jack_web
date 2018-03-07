class SkillsController < ApplicationController
  before_action :require_login
  before_action :set_skill, only: [:edit, :update, :destroy]
  def new
    @skill = Skill.new
  end

  def create
    if current_member.skills.create(skill_param)
      redirect_to member_path(current_member.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update_attributes(skill_param)
      redirect_to member_path(current_member.id)
    else
      render :new
    end
  end

  def destroy
    @skill.destroy
    redirect_to member_path(current_member.id)
  end

  private
  def set_skill
    @skill = Skill.find_by(id: params[:id])
  end
  def skill_param
    params.require(:skill).permit(:name, :start_at)
  end
end
