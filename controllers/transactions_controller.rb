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
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
 erb :"transactions/create"
end 

#find

#edit

#update

#delete