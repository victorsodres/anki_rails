class DeckSerializer < ActiveModel::Serializer
  attributes :id, :title, :url_title, :description, :user_id, :created_at, :updated_at
  has_many :cards, url: true
  belongs_to :user
  link(:self) { deck_url(object) }
end
