class CreateFavoriteBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_books do |t|
      t.integer :id
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
