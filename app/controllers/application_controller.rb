class ApplicationController < ActionController::API

  private
  def require_login
    # VALIDAR O TOKEN
    # request.headers[:authorization].split('Bearer ')[1]
  end

end
