class Team < ApplicationRecord
  has_many :boards

  has_many :user_teams
  has_many :users, :through => user_teams
end