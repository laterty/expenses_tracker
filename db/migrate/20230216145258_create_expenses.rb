class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name, null: false
      t.decimal :value, null: false, precision: 8, scale: 2
      t.text :description
      t.integer :amount, default: 1
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
