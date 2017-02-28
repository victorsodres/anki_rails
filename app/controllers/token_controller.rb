
class TokenController < ApplicationController

  def destroy
  end

  def show
    @user = User.find_by(token: params[:token])
    if @user
      render json: { sessionToken: @user['token'], user: @user['full_name'] }
    else
      render status: :not_authorized
    end
  end

  def create
    basic_auth_token = request.headers[:authorization].split('Basic ')[1]

    auth = Base64.decode64(basic_auth_token).split(':')

    authenticate_user(auth)

    render json: { sessionToken: @user['token'], user: auth[0] }
  end

  private
  def authenticate_user(auth)
    @user = User.find_by(full_name: auth[0]).try(:authenticate, auth[1])
  end

end
