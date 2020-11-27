class CnabToTransactionType
  def initialize(cnab_provider)
    @cnab_provider = cnab_provider
  end

  def get_transaction_type(type)
    case @cnab_provider.class.to_s
    when "CnabParser::Parser"
      from_cnab_default(type)
    else
      throw "cnab_provider does not exist"
    end
  end

  private

  def from_cnab_default(type)
    case type.to_i
    when 1
      TransactionType.new(description: "Débito", kind: "Entrada", token:"+")
    when 2
      TransactionType.new(description: "Boleto", kind: "Saída", token:"-")
    when 3
      TransactionType.new(description: "Financiamento", kind: "Saída", token:"-")
    when 4
      TransactionType.new(description: "Crédito", kind: "Entrada", token:"+")
    when 5
      TransactionType.new(description: "Recebimento Empréstimo", kind: "Entrada", token:"+")
    when 6
      TransactionType.new(description: "Vendas", kind: "Entrada", token:"+")
    when 7
      TransactionType.new(description: "Recebimento TED", kind: "Entrada", token:"+")
    when 8
      TransactionType.new(description: "Recebimento DOC", kind: "Entrada", token:"+")
    when 9
      TransactionType.new(description: "Aluguel", kind: "Saída", token:"-")
    else
      throw "Type does not exist"
    end
  end
end