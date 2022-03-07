module AccountTransactionsHelper
  
  def dep_or_saq (tr_type)
    if tr_type == 'C'
     'Depósito'
    else 
    	'Saque'
    end 
	end	
end
