require_relative('../models/transaction.rb')

#index
get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total_cost()
  erb :'transactions/index'
end  

#new

get '/transactions/new' do
  @categories = Category.all()
  @merchants = Merchant.all()
  erb :'transactions/new'
end 

#create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
 erb :"transactions/create"
end 

#find/show
  get '/transactions/:id' do 
    @transaction = Transaction.find(params['id'])
    @total = Transaction.total_cost()
    erb(:'transactions/show')
  end 

#edit
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @categories = Category.all
  @merchants = Merchant.all
  # get all the categories save into a variable @categories
  # get all the merchants save into a variable @merchants
  erb(:'transactions/edit')
end 

#update
put '/transactions/:id' do
  @transaction = Transaction.update(params)
  redirect to("/transactions/#{params[:id]}")
end 

#delete
