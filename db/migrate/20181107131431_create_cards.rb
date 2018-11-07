class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.integer :month
      t.integer :year
      t.integer :cvv
      t.string  :card_name
      t.timestamps
    end
  end
end
