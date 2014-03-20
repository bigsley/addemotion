class AddUserReferenceToMemories < ActiveRecord::Migration
  def change
    add_reference :memories, :user, index: true
  end
end
