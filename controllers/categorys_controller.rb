require_relative('../models/category')

#index
get '/categorys' do
  @categorys = Category.all
  erb(:'categorys/index')
end 
#new
get '/categorys/new' do
  erb(:'categorys/new')
end 

#create
post '/categorys' do
  @category = Category.new(params)
  @category.save
  redirect to("categorys")
  end 

#find/show
get '/categorys/:id' do
  @category = Category.find(params['id'])
  erb(:'categorys/show')
  end 

#edit
get '/categorys/:id/edit' do
  @category = Category.find(params[:id])
  erb(:'categorys/edit')
  end 

#update
put '/categorys/:id' do
  @category = Category.update(params)
  redirect to( "/categorys/#{params[:id]}" )
end 


#delete

