class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.belongs_to :cart
    	t.belongs_to :book
    	t.integer :quantity

      t.timestamps
    end
  end
end
