class CreateTableStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|
      t.belongs_to :board, foreign_key: true
      t.string :name, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
