class CreateTableUserBoard < ActiveRecord::Migration[7.1]
  def change
    create_table :user_boards do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :board, foreign_key: true
      t.timestamps
    end
  end
end
