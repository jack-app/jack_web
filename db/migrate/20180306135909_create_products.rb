class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.date :start_at
      t.date :end_at
      t.text :describe

      t.timestamps
    end
  end
end
