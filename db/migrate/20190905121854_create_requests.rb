class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :id
      t.integer :book_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
