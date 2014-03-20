class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :mood
      t.string :stress

      t.timestamps
    end
  end
end
