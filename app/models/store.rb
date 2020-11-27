class Store < ApplicationRecord
  has_many :financial_transactions

  validates :name, :owner, presence: true
end
