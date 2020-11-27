class TransactionTypeRepository
  def save(transaction_type_model)
    if transaction_type_model.save!
      transaction_type_model
    end
  end
  
  def get_all
    TransactionType.all
  end

  def get_by_id(id)
    TransactionType.find(id)
  end
end