class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.text :body
      t.integer :member_id

      t.timestamps
    end
  end
end
