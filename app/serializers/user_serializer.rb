class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :description, :created_at
  has_many :decks
  link(:self) { user_url(object) }
end
