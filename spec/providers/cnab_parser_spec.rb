require 'rails_helper'

RSpec.describe CnabParser::Parser, type: :provider do
  describe '#format' do
    let(:cnab_txt) do
      "3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO"
    end

    let(:cnab_formated) do
      described_class.new.format(cnab_txt)
    end

    it 'should return cnab parsed' do
      expect(cnab_formated[:transaction_type]).to eq("3")
      expect(cnab_formated[:date].strftime("%Y-%m-%d")).to eq("2019-03-01")
      expect(cnab_formated[:value]).to eq(142.0)
      expect(cnab_formated[:cpf]).to eq("09620676017")
      expect(cnab_formated[:card]).to eq("4753****3153")
      expect(cnab_formated[:date_time_at].strftime("%Y-%m-%d %H:%M:%S %Z %z")).to eq("2019-03-01 15:34:53 -03 -0300")
      expect(cnab_formated[:store_owner]).to eq("JOÃO MACEDO")
      expect(cnab_formated[:store_name]).to eq("BAR DO JOÃO")
    end
  end
end
