class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :credit_card_number
      t.integer :month
      t.integer :year
      t.integer :cvv
      t.string  :card_name
      t.timestamps
    end
  end
end
