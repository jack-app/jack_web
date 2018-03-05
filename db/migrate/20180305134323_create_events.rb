class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :genre
      t.string :place
      t.text :describe
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
