class StoresController < ApplicationController
  def index
    @stores = StoreRepository.new.get_all
  end

  def show
    @store = StoreRepository.new.get_by_id_with_transactions(params[:id])
  end
end