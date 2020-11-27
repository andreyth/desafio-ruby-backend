require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:card) }
    it { should validate_presence_of(:date_time_at) }
  end

  describe 'associations' do
    it { should belong_to(:store) }
    it { should belong_to(:transaction_type) }
  end
end
