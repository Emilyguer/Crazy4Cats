class RemoveNotNullConstraintFromReactions < ActiveRecord::Migration[7.0]
  def change
    change_column :reactions, :post_id, :integer, null: true
  end
end
