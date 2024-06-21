class CreateTableTaskComments < ActiveRecord::Migration[7.1]
  def change
    create_table :task_comments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :task, foreign_key: true
      t.text :body, null: false
      t.string :filename
      t.timestamps
    end
  end
end
