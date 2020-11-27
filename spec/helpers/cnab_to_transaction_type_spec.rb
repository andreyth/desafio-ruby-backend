require 'rails_helper'

RSpec.describe CnabToTransactionType, type: :helper do
  describe '#get_transaction_type' do
    let(:transaction_type) do
      described_class.new(CnabParser::Parser.new()).get_transaction_type(1)
    end

    it 'should return instance of TransactionType' do
      expect(transaction_type).to be_an_instance_of(TransactionType)
    end
  end
end