class UserBoard < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :user_id, presence: { message: "The user_board should have a user_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :board_id, presence: { message: "The user_board should have a board_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
end
