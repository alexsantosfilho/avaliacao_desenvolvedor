class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.text :description
      t.decimal :unit_price
      t.integer :quantity

      t.timestamps
    end
  end
end
