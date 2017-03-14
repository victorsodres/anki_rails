class CardsController < ApplicationController
  def index
    cards = Card.all
    render json: cards
  end
  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  def create
    deck = Deck.find_by(id: params[:id_deck])
    data = params[:data][:attributes]
    card = Card.create(front: data[:front], back: data[:back], description: data[:description], deck: deck)
    render json: card, status: :created
  end

  def update
    data = params[:data][:attributes]
    card = Card.update(params[:id], front: data[:front], back: data[:back],
      description: data[:description], difficulty: data[:difficulty],
      date_last_reviewed: data['date-last-reviewed'], days_between_reviews: data['days-between-reviews'])

    render status: :no_content
    # update_attributes
  end

end
