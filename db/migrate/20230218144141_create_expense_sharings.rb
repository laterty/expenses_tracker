class CreateExpenseSharings < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_sharings do |t|
      t.bigint :sender_id, null: false
      t.bigint :recipient_id, null: false

      t.timestamps
    end
  end
end
