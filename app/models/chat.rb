class Chat < ApplicationRecord
  has_many :user_chats
  has_many :users, through: :user_rooms

  has_many :room_chats
  has_many :rooms, through: :room_chats
end
