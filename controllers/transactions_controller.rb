require_relative('../models/transaction.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  erb :'transactions/index'
end  

#new

get '/transactions/new' do
  @categorys = Category.all()
  @merchants = Merchant.all()
  erb :'transactions/new'
end 

#create

#find

#edit

#update

#delete