
class SessionController < ApplicationController

  def destroy
    reset_session
  end

  def show
    @user = User.find_by(id: session[:current_user_id])
    if @user
      render json: { user: @user['full_name'] }
    else
      render status: :unauthorized
    end
  end

  def create
    basic_auth_token = request.headers[:authorization].split('Basic ')[1]

    auth = Base64.decode64(basic_auth_token).split(':')

    authenticate_user(auth)

    render json: { user: auth[0] }
  end

  private
  def authenticate_user(auth)
    @user = User.find_by(email: auth[0]).try(:authenticate, auth[1])
    session[:current_user_id] = @user.id
    session[:current_user_token] = @user['token']
  end

end
