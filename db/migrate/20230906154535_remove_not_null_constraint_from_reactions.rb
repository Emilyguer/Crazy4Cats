class RemoveNotNullConstraintFromReactions < ActiveRecord::Migration[7.0]
  def change
    change_column :reactions, :post_id, :integer, null: true
    change_column :reactions, :comment_id, :bigint, null: true
  end
end
