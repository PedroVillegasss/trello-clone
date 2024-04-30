class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :labels
  has_many :informer_tasks, class_name: 'Task', foreign_key: 'informer_user_id'
  has_many :assignee_tasks, class_name: 'Task', foreign_key: 'informer_user_id'
  has_many :task_comments

  has_many :user_boards
  has_many :boards, :through => :user_boards

  has_many :user_tasks
  has_many :tasks, :through => :user_tasks

  has_many :user_teams
  has_many :teams, :through => :user_teams
end
