class AddOrderIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :order_id, :integer
  end
end
