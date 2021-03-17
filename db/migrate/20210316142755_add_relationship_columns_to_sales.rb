class AddRelationshipColumnsToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :address_id, :integer
    add_column :sales, :customer_id, :integer
    add_column :sales, :vendor_id, :integer
  end
end
