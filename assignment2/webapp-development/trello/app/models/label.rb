class Label < ApplicationRecord
  has_many :tasks
  belongs_to :user
  belongs_to :board
end
