class AddIconUrlToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :icon_url, :string
  end
end
