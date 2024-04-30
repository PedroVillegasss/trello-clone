class Board < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true
  has_many :states, dependent: :destroy
  has_many :labels, dependent: :destroy

  has_many :user_boards
  has_many :users, :through => :user_boards
end