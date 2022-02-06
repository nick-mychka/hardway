class CreateMarathons < ActiveRecord::Migration[6.1]
  def change
    create_table :marathons do |t|
      t.string :title
      t.string :cover_url
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
