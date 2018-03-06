class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :university
      t.string :password_digest
      t.date :enroll
      t.boolean :leader, default: false
      t.text :profile
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
