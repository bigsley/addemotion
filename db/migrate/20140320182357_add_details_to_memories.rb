class AddDetailsToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :explanation, :string
  end
end
