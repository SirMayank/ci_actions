class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_id, null: false
      t.integer :points, null: false
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false

      t.timestamps
    end

    add_index :transactions, :transaction_id, unique: true
  end
end
