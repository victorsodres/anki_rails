class CardSerializer < ActiveModel::Serializer
  attributes :id, :front, :back, :description,
    :deck_id, :created_at, :updated_at,
    :days_between_reviews, :date_last_reviewed, :difficulty

  belongs_to :deck, url: true
  link(:self) { card_url(object) }
end
