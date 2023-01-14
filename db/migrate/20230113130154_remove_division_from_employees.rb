class RemoveDivisionFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_reference :employees, :division, null: false, foreign_key: true
    add_reference :employees, :division, null: true, foreign_key: true
  end
end
