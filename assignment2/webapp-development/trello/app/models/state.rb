class State < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :board_id, presence: { message: "The state must belong to a board_id (board)" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :name, presence: { message: "The state should have a name" }
  validates :position, presence: { message: "The state should have a position in the board" }, numericality: {only_integer: true, message: "Must be a valid position number"}
end
