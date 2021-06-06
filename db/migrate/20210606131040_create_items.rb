class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :done

      t.timestamps
    end
  end
end
