class AddIndexToCustomersName < ActiveRecord::Migration[6.1]
  def change
    add_index :customers, :name, unique: true
  end
end
