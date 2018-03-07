class CreateProductLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :product_links do |t|
      t.string :name
      t.string :url
      t.integer :product_id

      t.timestamps
    end
  end
end
