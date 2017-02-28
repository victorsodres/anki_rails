class CardSerializer < ActiveModel::Serializer
  attributes :id, :front, :back, :description, :deck_id, :created_at, :updated_at
  belongs_to :deck
  link(:self) { card_url(object) }
  link(:deck) { deck_url(object) }
end
