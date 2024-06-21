class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :user_id, presence: { message: "The user_task should have a user_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :task_id, presence: { message: "The user_task should have a task_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
end
