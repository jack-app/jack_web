class AddRepeatSchoolDepartmentToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :repeat, :integer, default: 0
  end
end
