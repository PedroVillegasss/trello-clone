class TaskComment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :user_id, presence: { message: "The task_comment should have a user_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :task_id, presence: { message: "The task_comment should have a task_id" }, numericality: {only_integer: true, message: "Must be a valid id"}
  validates :body, presence: { message: "The task_comment should have a body" }

end
