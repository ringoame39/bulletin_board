class CreateRoomChats < ActiveRecord::Migration[5.0]
  def change
    create_table :room_chats do |t|
      t.integer :chat_id
      t.integer :room_id

      t.timestamps
    end
  end
end
