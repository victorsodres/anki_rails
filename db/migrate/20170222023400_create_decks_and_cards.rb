class CreateDecksAndCards < ActiveRecord::Migration[5.0]
  def change

    create_table :decks do |t|
      t.belongs_to :user, index: true
      t.timestamps
      t.string      :title
      t.string      :url_title
      t.text        :description
    end

    create_table :cards do |t|
      t.belongs_to :deck, index: true
      t.timestamps
      t.string      :front
      t.string      :back
      t.text        :description
    end

  end
end
