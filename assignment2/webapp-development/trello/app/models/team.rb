class Team < ApplicationRecord
  has_many :boards

  has_many :user_teams
  has_many :users, :through => :user_teams


  validates :name, presence: { message: "The team should have a name" }
end
