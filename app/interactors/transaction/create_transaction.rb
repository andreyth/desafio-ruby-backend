module Transaction
  class CreateTransaction
    def initialize(
      cnab_provider,
      financial_transaction_repository,
      transaction_type_repository,
      store_repository
    )
      @cnab_provider = cnab_provider
      @financial_transaction_repository = financial_transaction_repository
      @transaction_type_repository = transaction_type_repository
      @store_repository = store_repository
    end

    def call(cnab_file)
      cnab_file.lines.each do |data|
        cnab_info = @cnab_provider.format(data)
        store_result = self.create_store_if_not_exist(cnab_info[:store_name], cnab_info[:store_owner])
        transaction_type = self.create_transaction_type(cnab_info[:transaction_type])
        transaction = self.create_financial_transaction(cnab_info, store_result, transaction_type)
      end
    end

    def create_store_if_not_exist(name, owner)
      store = @store_repository.get_by_name_and_owner_or_create(name, owner)
      unless store.valid?
        raise ValidationError.new(store.errors)
      end
      store
    end

    def create_transaction_type(type)
      cnab_to_transaction_type = CnabToTransactionType.new(@cnab_provider)
      transaction_type = cnab_to_transaction_type.get_transaction_type(type)
      unless transaction_type.valid?
        raise ValidationError.new("transaction_type not valid")
      end

      return @transaction_type_repository.save(transaction_type)
    end

    def create_financial_transaction(cnab_info, store_result, transaction_type)
      financial_transaction = FinancialTransaction.new(
        value: cnab_info[:value],
        cpf: cnab_info[:cpf],
        card: cnab_info[:card],
        date_time_at: cnab_info[:date_time_at],
        store: store_result,
        transaction_type: transaction_type
      )

      unless financial_transaction.valid?
        raise ValidationError.new("financial_transaction not valid")
      end
      
      @financial_transaction_repository.save(financial_transaction)
    end
  end
end