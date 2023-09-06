class AddReactionableToReactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :reactions, :reactionable, polymorphic: true
  end
end
