require_relative('../models/category')

#index
get '/categories' do
  @categories = Category.all
  erb(:'categories/index')
end 
#new
get '/categories/new' do
  erb(:'categories/new')
end 

#create
post '/categories' do
  @category = Category.new(params)
  @category.save
  redirect to("categories")
end 

#find/show
get '/categories/:id' do
  @category = Category.find(params['id'])
  erb(:'categories/show')
end 

#edit
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb(:'categories/edit')
end 

#update
put '/categories/:id' do
  @category = Category.update(params)
  redirect to( "/categories/#{params[:id]}" )
end 

#delete
delete '/categories/:id' do
  Category.destory(params[:id])
  redirect to("/categories")
end 

