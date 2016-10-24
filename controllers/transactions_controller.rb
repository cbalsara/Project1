require_relative('../models/transaction.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  erb :'transactions/index'
end  

#new

#create

#find

#edit

#update

#delete