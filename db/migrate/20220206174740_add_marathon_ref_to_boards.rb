class AddMarathonRefToBoards < ActiveRecord::Migration[6.1]
  def change
    add_reference :boards, :marathon, null: true, foreign_key: true
  end
end
