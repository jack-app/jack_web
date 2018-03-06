class CreateSnsLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :sns_links do |t|
      t.string :name
      t.string :url
      t.integer :member_id

      t.timestamps
    end
  end
end
