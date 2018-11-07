class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string  :method
      t.integer :max_days
      t.integer :min_days
      t.decimal :delivery_price
      t.timestamps
    end
  end
end
