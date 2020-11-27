class TransactionType < ApplicationRecord
  has_one :financial_transaction

  validates :description, :kind, :token, presence: true
end
