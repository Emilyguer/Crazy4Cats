class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :description
      t.datetime :when_went

      t.timestamps
    end
  end
end
