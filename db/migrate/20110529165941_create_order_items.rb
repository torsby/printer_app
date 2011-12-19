class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
    t.column :product_id, :integer
    t.column :order_id, :integer
    t.column :price, :float
    t.column :amount, :integer
    t.column :created_at, :timestamp
    t.column :updated_at, :timestamp
  end
end
def self.down
drop_table :order_items
  end
end
