class AddOrderIdToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :order_id, :integer
  end
end
