
class Appoints

	def self.call(origin_account_id, dest_account_id, amount_debt)

    account = Account.find(origin_account_id) 

    if account
      tax_value = tax_value(amount_debt)

      if ((account.account_balance - tax_value - amount_debt) >= 0)

        # Atomicity Control
        AccountTransaction.transaction do

          # Creating debit transfer
          @lancto_origem = AccountTransaction.create(account_id: origin_account_id,
                                          date: Date.current, description: 'SAIDA P/ TRANSFERÊNCIA', tr_type: 'D', amount: amount_debt , doc_ref: "CONTA: #{dest_account_id}" )

          # Tax Debt
          @lancto_origem = AccountTransaction.create(account_id: origin_account_id,
                                                     date: Date.current, description: 'TAXA DE TRANSFERÊNCIA', tr_type: 'D', amount: tax_value )

          # Crediting the amount in the destiny Account
          @lancto_destino = AccountTransaction.create(account_id: dest_account_id,
                                           date: Date.current, description: 'TRANSFERENCIA', tr_type: 'C', amount: amount_debt, doc_ref: "TRANSF. DA CC: #{origin_account_id}"  )
          msg = 'Transferência realizada com Sucesso!'
        end
      else
        msg = "Saldo insuficiente descontado o valor da TAXA de , operação não realizada"
      end

    else
      msg = "Conta ORIGEM - Cód. #{origin_account_id} não encontrada!"
    end

    return msg

  end


	def self.tax_value(value_debt)
   
    date_transf = Time.current

    week_day = date_transf.wday # onde 0 é domingo
    hour = date_transf.hour

    normal_day = *(1..5) # Segunda a Sexta
    if normal_day.include?(week_day) and (hour >= 9 and hour <= 18)
      tax = 5
    else
      tax = 7
    end

    if (value_debt > 1000) # Acima de 1000 , adicional de 10 reais
      tax += 10
    end

    return tax
  end

end