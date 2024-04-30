class Task < ApplicationRecord
  belongs_to :state
  belongs_to :informer_user_id, class_name: 'User', foreign_key: 'informer_user_id_id'
  belongs_to :assignee_user_id, class_name: 'User', foreign_key: 'assignee_user_id_id', optional: true
  belongs_to :label, optional: true
  has_many :task_comments

  has_many :user_tasks
  has_many :users, :through => :user_tasks
end
