class ApplicationController < ActionController::API

  private
  def require_login
    # VALIDAR O TOKEN
    # request.headers[:authorization].split('Bearer ')[1]
    render plain: 'unauthorized', status: :unauthorized unless session[:current_user_id]
  end

end
