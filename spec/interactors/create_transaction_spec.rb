require 'rails_helper'

RSpec.describe Transaction::CreateTransaction, type: :interactor do
  describe "#call" do
    before(:each) do
      @cnab_parser_provider = CnabParser::Parser.new
      @financial_transaction_repository = FakeFinancialTransactionRepository.new
      @transaction_type_repository = FakeTransactionTypeRepository.new
      @store_repository = FakeStoreRepository.new
  
      @file = File.read("./spec/support/CNAB.txt")
    end

    it "should create a new transaction" do
      Transaction::CreateTransaction.new(
        @cnab_parser_provider,
        @financial_transaction_repository,
        @transaction_type_repository,
        @store_repository
      ).call(@file)
  
      financial_transactions = @financial_transaction_repository.get_all
      transaction_types = @transaction_type_repository.get_all
      stores = @store_repository.get_all

      transaction_type = @transaction_type_repository.get_by_id(financial_transactions[0].transaction_type_id)
      store = @store_repository.get_by_id(financial_transactions[0].store_id)
      
      expect(financial_transactions.length).to eq(3)
      expect(stores.length).to eq(2)
      expect(transaction_types.length).to eq(3)
      expect(financial_transactions[0].value).to eq(142.0)
      expect(financial_transactions[0].cpf).to eq("09620676017")
      expect(financial_transactions[0].card).to eq("4753****3153")
      expect(financial_transactions[0].date_time_at.strftime("%Y-%m-%d %H:%M:%S %Z %z")).to eq("2019-03-01 15:34:53 -03 -0300")
      expect(transaction_type.description).to eq("Financiamento")
      expect(transaction_type.kind).to eq("Saída")
      expect(transaction_type.token).to eq("-")
      expect(store.owner).to eq("JOÃO MACEDO")
      expect(store.name).to eq("BAR DO JOÃO")
    end
  end
end
