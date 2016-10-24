require_relative('../models/merchant')

#index
get '/merchants' do
  @merchants = Merchant.all
  erb(:'merchants/index')
end 
#new
get '/merchants/new' do
  erb(:'merchants/new')
end 
#create
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to("merchants")
  end 

#find/show
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb(:'merchants/show')
  end 
#edit

#update

#delete