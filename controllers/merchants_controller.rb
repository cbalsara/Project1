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
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:'merchants/edit')
  end 

#update
put '/merchants/:id' do
  @merchant = Merchant.update(params)
  redirect to ("merchants/#{params[:id]}")
end 
#delete
delete '/merchants/:id' do
  Merchant.destory(params[:id])
  redirect to("/merchants")
end 


