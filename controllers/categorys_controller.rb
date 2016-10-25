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
  @total = Transaction.total_cost()
  erb(:'categorys/show')
  end 

#edit

#update<h3> All Transactions of Clicked Category:</h3>


  

#delete