class CreateTableLabels < ActiveRecord::Migration[7.1]
  def change
    create_table :labels do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :board, foreign_key: true
      t.string :name, null: false
      t.string :color, null: false
      t.timestamps
    end
  end
end
