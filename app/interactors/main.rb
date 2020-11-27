class Main
  def initialize
    cnab_parser_provider = CnabParser::Parser.new
    financial_transaction_repository = FinancialTransactionRepository.new
    transaction_type_repository = TransactionTypeRepository.new
    store_repository = StoreRepository.new

    file = File.read("CNAB.txt")

    begin
      ActiveRecord::Base.transaction do
        Transaction::CreateTransaction.new(
          cnab_parser_provider,
          financial_transaction_repository,
          transaction_type_repository,
          store_repository
        ).call(file)
      end
    rescue => e
      raise e
      # puts e.backtrace
      # puts "Rescued: #{e.inspect}"
    end
  end
end