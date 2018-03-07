module SessionsHelper
  def login(member)
    session[:member_id] = member.id
  end

  def login?
    !!current_member
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end

  def member_auth?(member_id)
    login? && current_member.id.to_i == member_id.to_i
  end

  def logout
    session.delete(:member_id)
    @current_member = nil
  end

  def require_login
    until login?
      redirect_to root_path and return
    end
  end
end
