class FakeStoreRepository
  def initialize
    @stores = []
  end

  def save(store_model)
    if store_model.id
      index = @stores.index{|store| store.id == store_model.id}
      @stores[index] = store
    else
      store_model.id = @stores.length + 1
      @stores.push(store_model)
    end

    store_model
  end

  def get_all
    @stores
  end

  def get_by_id(id)
    @stores.select{|store| store.id == id}[0]
  end

  def get_by_name_and_owner_or_create(name, owner)
    index = @stores.index{|store| (store.name == name and store.owner == owner)}
    store = nil
    if index
      store = @stores[index]
    else
      store = Store.new(name: name, owner: owner)
      store = self.save(store)
    end
    
    store
  end
end