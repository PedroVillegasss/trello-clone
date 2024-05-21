class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :user_id, presence: { message: "The user_team should have a user_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :team_id, presence: { message: "The user_team should have a team_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
end
