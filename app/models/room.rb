class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms

  has_many :room_chats
  has_many :chats, through: :room_chats
end
