class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    if user_has_session?
      render plain: 'unauthorized', status: :unauthorized
    else
      data = params[:data][:attributes]
      @user = User.new(email: data[:email], password: data[:password], full_name: data["full-name"])
      @user.save
      render json: @user, status: :created
    end
  end

end
