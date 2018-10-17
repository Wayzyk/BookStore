class ChangeFloatPriceColumnToDecimal < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :price, :decimal, precision: 12, scale: 2
  end

  def down
    change_column :books, :price, :float
  end
end
