class RemoveColumnPercentageFromCoupons < ActiveRecord::Migration[5.2]
  def change
    remove_column :coupons, :percentage, :boolean, default: false
  end
end
