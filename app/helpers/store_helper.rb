module StoreHelper
  def total_balance(financial_transactions)
    total = 0
    financial_transactions.each do |financial|
      total = calc(total, financial.value, financial.transaction_type.token)
    end

    total
  end

  private

  def calc(total, value, token)
    case token
    when "+"
      total += value
    when "-"
      total -= value
    end
    total
  end
end