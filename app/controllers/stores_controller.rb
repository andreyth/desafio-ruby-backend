class StoresController < ApplicationController
  def index
    @stores = store_repository.get_all
  end

  def show
    @store = store_repository.get_by_id_with_transactions_and_transaction_types(params[:id])
  end

  private

  def store_repository
    StoreRepository.new
  end
end