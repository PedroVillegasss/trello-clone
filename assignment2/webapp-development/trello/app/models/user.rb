# https://guides.rubyonrails.org/active_record_validations.html#when-does-validation-happen-questionmark:~:text=class%20EmailValidator%20%3C%20ActiveModel%3A%3AEachValidator%0A%20%20def%20validate_each(record%2C%20attribute%2C%20value)%0A%20%20%20%20unless%20URI%3A%3AMailTo%3A%3AEMAIL_REGEXP.match%3F(value)%0A%20%20%20%20%20%20record.errors.add%20attribute%2C%20(options%5B%3Amessage%5D%20%7C%7C%20%22is%20not%20an%20email%22)%0A%20%20%20%20end%0A%20%20end%0Aend

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless URI::MailTo::EMAIL_REGEXP.match?(value)
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_many :labels, dependent: :destroy
  has_many :informer_tasks, class_name: 'Task', foreign_key: 'informer_user_id', dependent: :destroy
  has_many :assignee_tasks, class_name: 'Task', foreign_key: 'assignee_user_id'
  has_many :task_comments

  has_many :user_boards
  has_many :boards, :through => :user_boards

  has_many :user_tasks
  has_many :tasks, :through => :user_tasks

  has_many :user_teams
  has_many :teams, :through => :user_teams


  validates :name, presence: { message: "The user should have a name" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "The user should have a valid email" }
  validates :encrypted_password, presence: true, length: { minimum: 3, message: "The user's password should have a minimum length of 3 characters" }
end
