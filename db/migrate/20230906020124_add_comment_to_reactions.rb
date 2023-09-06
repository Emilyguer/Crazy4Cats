class AddCommentToReactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :reactions, :comment, foreign_key: true
  end
end
