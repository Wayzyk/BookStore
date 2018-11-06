class AddCouponIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :coupon_id, :integer, index: true
  end
end
