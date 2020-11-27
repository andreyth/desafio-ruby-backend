class FinancialTransactionsController < ApplicationController
  def index

  end

  def create
    file = File.read(params[:file])
    
    begin
      ActiveRecord::Base.transaction do
        Transaction::CreateTransaction.new(
          CnabParser::Parser.new,
          FinancialTransactionRepository.new,
          TransactionTypeRepository.new,
          StoreRepository.new
        ).call(file)

        redirect_to root_path, notice: "Success"
      end
    rescue => e
      raise e
      redirect_to financial_transactions_path, notice: "Error"
    end
  end
end