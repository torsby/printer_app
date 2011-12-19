class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :manufacturer
      t.text :description
      t.float :price
      t.text :features
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
