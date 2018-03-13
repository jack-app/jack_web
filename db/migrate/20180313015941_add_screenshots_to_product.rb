class AddScreenshotsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :screenshots, :text
  end
end
