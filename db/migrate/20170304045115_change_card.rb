class ChangeCard < ActiveRecord::Migration[5.0]
  def change
    change_table :cards do |t|
      t.float :days_between_reviews
      t.datetime :date_last_reviewed
      t.float :difficulty
    end
  end
end
