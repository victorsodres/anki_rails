class DecksController < ApplicationController
  before_action :require_login

  def index
    decks = Deck.find_by(user_id: session[:current_user_id]) || []
    render json: decks
  end

  def show
    @deck = Deck.find(params[:id])
    render json: @deck
  end

  def create
    user = User.find_by(id: session[:current_user_id])
    data = params[:data][:attributes]
    deck = Deck.create(title: data[:title], url_title: data[:title].dasherize, description: data[:description], user: user)
    render json: deck, status: :created
  end

end
