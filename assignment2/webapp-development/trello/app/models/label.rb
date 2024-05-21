class Label < ApplicationRecord
  has_many :tasks
  belongs_to :user
  belongs_to :board

  validates :user_id, presence: { message: "The label should have a user_id (creator)" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :board_id, presence: { message: "The label must belong to a board_id (board)" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :name, presence: { message: "The label should have a name" }
  validates :color, presence: { message: "The label should have a valid color" }

end
