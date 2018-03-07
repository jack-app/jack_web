class MembersController < ApplicationController
  include MembersHelper
  before_action :require_auth, only: [:edit, :update, :destroy]
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  def new
    @member = Member.new
  end
  def create
    @member = Member.new(member_param)
    if @member.save
      login @member
      redirect_to members_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @member.update_attributes(member_param)
      redirect_to member_path(@member)
    else
      render :edit
    end
  end
  def index
    @members = Member.where(leader: false)
    @leaders = Member.where(leader: true)
  end

  def show
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end
  def member_param
    params.require(:member).permit(:name, :email, :university, :password, :password_confirmation, :enroll, :profile)
  end
  def require_auth
    until (login? && current_member.id.to_i == params[:id].to_i)
      redirect_to member_path(params[:id]) and return
    end
  end
end
