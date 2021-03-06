class StoreRepository
  def save(store_model)
    if store_model.save!
      store_model
    end
  end

  def get_all
    Store.all
  end

  def get_by_id(id)
    Store.find(id)
  end

  def get_by_name_and_owner_or_create(name, owner)
    Store.where(name: name, owner: owner).first_or_create
  end

  def get_by_id_with_transactions_and_transaction_types(id)
    Store.includes(:financial_transactions, :financial_transactions => :transaction_type).find(id)
  end
end