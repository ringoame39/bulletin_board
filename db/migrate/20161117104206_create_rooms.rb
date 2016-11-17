class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
