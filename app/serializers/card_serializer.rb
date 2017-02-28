class CardSerializer < ActiveModel::Serializer
  attributes :id, :front, :back, :description, :deck_id, :created_at, :updated_at
  belongs_to :deck, url: true
  link(:self) { card_url(object) }
end
