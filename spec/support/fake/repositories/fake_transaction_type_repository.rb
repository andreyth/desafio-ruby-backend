class FakeTransactionTypeRepository
  def initialize
    @transaction_types = []
  end

  def save(transaction_type_model)
    if transaction_type_model.id
      index = @transaction_types.index{|transaction_type| transaction_type.id == transaction_type_model.id}
      @transaction_types[index] = transaction_type
    else
      transaction_type_model.id = @transaction_types.length + 1
      @transaction_types.push(transaction_type_model)
    end

    transaction_type_model
  end

  def get_all
    @transaction_types
  end

  def get_by_id(id)
    @transaction_types.select{|transaction_type| transaction_type.id == id}[0]
  end
end