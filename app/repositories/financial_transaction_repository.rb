class FinancialTransactionRepository
  def save(financial_transaction_model)
    if financial_transaction_model.save!
      financial_transaction_model
    end
  end
  
  def get_all
    FinancialTransaction.all
  end

  def get_by_id(id)
    FinancialTransaction.find(id)
  end
end