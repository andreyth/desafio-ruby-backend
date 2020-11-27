class CreateFinancialTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_transactions do |t|
      t.references :transaction_type, null: false, foreign_key: true
      t.decimal :value
      t.string :cpf
      t.string :card
      t.datetime :date_time_at
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
