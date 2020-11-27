require 'rails_helper'

RSpec.describe StoreHelper, type: :helper do
  describe '#total_balance' do
    it 'should return the total balance amount' do
      financial_transactions = []

      transaction_type1 = TransactionType.new(description: "Débito", kind: "Entrada", token: "+")
      financial_transactions.push(FinancialTransaction.new(transaction_type: transaction_type1, value: 250))

      transaction_type2 = TransactionType.new(description: "Financiamento", kind: "Saída", token: "-")
      financial_transactions.push(FinancialTransaction.new(transaction_type: transaction_type2, value: 200))

      transaction_type3 = TransactionType.new(description: "Recebimento Empréstimo", kind: "Entrada", token: "+")
      financial_transactions.push(FinancialTransaction.new(transaction_type: transaction_type3, value: 30))

      result = total_balance(financial_transactions)
      expect(result).to eq(80)
    end
  end
end