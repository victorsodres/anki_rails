class DecksController < ApplicationController
  before_action :require_login

  def index
    decks = Deck.all
    render json: decks
  end
  def show
    @deck = Deck.find(params[:id])
    render json: @deck
  end
end
