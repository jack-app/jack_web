class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && (member.password_digest == "" || member.authenticate(params[:session][:password]))
      login member
      redirect_to member_path(member)
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
