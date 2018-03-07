class AddSloganToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slogan, :string
  end
end
