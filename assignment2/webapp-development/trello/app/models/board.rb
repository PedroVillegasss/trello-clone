class Board < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true
  has_many :states, dependent: :destroy
  has_many :labels, dependent: :destroy
  accepts_nested_attributes_for :states

  has_many :user_boards
  has_many :users, :through => :user_boards

  after_create :create_default_states


  private

  def create_default_states
    states.create([{ name: "TODO", position: 1 }, { name: "WIP", position: 2 }, { name: "DONE", position: 3 }])
  end
end
