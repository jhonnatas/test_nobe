module AccountsHelper
  
  def check_active (account)
    if account.account_active?
      'Conta ativa'
    else 
      'Conta inativa'
    end  
  end 

end
