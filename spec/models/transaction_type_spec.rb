require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:token) }
  end

  describe 'associations' do
    it { should have_one(:financial_transaction) }
  end
end
