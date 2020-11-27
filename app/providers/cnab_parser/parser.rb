module CnabParser
  class Parser
    attr_accessor :cnab
    
    def format(cnab)
      @cnab = cnab
      {}.tap do |cnab_formated|
        cnab_formated[:transaction_type] = parsed_transaction_type
        cnab_formated[:date] = Date.parse(parsed_date)
        cnab_formated[:value] = parsed_value
        cnab_formated[:cpf] = parsed_cpf
        cnab_formated[:card] = parsed_card
        cnab_formated[:date_time_at] = Time.zone.parse(date_time_parsed)
        cnab_formated[:store_owner] = parsed_store_owner.strip
        cnab_formated[:store_name] = parsed_store_name.strip
      end
    end

    private

    def parsed_transaction_type
      @cnab[0]
    end

    def parsed_date
      "#{@cnab[1..4]}-#{@cnab[5..6]}-#{@cnab[7..8]}"
    end

    def parsed_value
      @cnab[9..18].to_i / 100.00
    end

    def parsed_cpf
      @cnab[19..29]
    end

    def parsed_card
      @cnab[30..41]
    end

    def date_time_parsed
      "#{parsed_date} #{@cnab[42..43]}:#{@cnab[44..45]}:#{@cnab[46..47]}"
    end

    def parsed_store_owner
      @cnab[48..61]
    end

    def parsed_store_name
      @cnab[62..80]
    end
  end
end