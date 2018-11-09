class AddApprovedFieldToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :approved, :boolean, default: false
  end
end
