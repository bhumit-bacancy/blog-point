class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.time :time
      t.string :venue
      t.string :city
      t.timestamps
    end
  end
end
