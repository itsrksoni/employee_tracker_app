class AddReferencesToEmployees < ActiveRecord::Migration[7.0]
  def change

    add_reference :employees, :master_role, null: false, foreign_key: true
    add_reference :employees, :division, null: false, foreign_key: true

  end
end
