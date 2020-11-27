class FakeFinancialTransactionRepository
  def initialize
    @financial_transactions = []
  end

  def save(financial_transaction_model)
    if financial_transaction_model.id
      index = @financial_transactions.index{|transaction_type| transaction_type.id == financial_transaction_model.id}
      @financial_transactions[index] = transaction_type
    else
      financial_transaction_model.id = @financial_transactions.length + 1
      @financial_transactions.push(financial_transaction_model)
    end

    financial_transaction_model
  end

  def get_all
    @financial_transactions
  end

  def get_by_id(id)
    @financial_transactions.select{|financial_transaction| financial_transaction.id == id}[0]
  end
end