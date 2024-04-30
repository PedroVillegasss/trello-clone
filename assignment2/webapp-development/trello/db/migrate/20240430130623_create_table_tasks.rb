class CreateTableTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :state, foreign_key: true
      t.references :informer_user_id, foreign_key: { to_table: :users }, null: false
      t.references :assignee_user_id, foreign_key: { to_table: :users }
      t.references :label, foreign_key: true
      t.string :name, null: false
      t.integer :priority
      t.text :description
      t.timestamps
    end
  end
end
