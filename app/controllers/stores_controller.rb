class StoresController < ApplicationController
  def index
    @stores = StoreRepository.new.get_all
  end
end