class AddBoardRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :board, null: true, foreign_key: true
  end
end
