class AddIndexToAddressesName < ActiveRecord::Migration[6.1]
  def change
    add_index :addresses, :name, unique: true
  end
end
