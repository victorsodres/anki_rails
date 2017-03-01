class ApplicationController < ActionController::API

  private
  def require_login
    # VALIDAR O TOKEN
    # request.headers[:authorization].split('Bearer ')[1]
    render plain: 'unauthorized', status: :unauthorized unless user_has_session?
  end

  def user_has_session?
    return session[:current_user_id] != nil
  end

end
