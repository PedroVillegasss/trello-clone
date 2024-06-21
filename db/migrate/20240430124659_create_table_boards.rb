class CreateTableBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.belongs_to :user, foreign_key: true
      t.references :team, foreign_key: true, null: true
      t.string :name, null: false
      t.string :color
      t.boolean :is_public, default: false
      t.timestamps
    end
  end
end
