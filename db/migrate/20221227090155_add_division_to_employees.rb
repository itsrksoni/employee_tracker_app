class AddDivisionToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :division, null: false, foreign_key: true
  end
end
