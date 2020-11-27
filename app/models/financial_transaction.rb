class FinancialTransaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :store

  validates :value, :cpf, :card, :date_time_at, presence: true
end
