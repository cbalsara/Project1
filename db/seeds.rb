require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/transaction')

Transaction.delete_all()
Category.delete_all()
Merchant.delete_all()


category1 = Category.new({ 'type' => 'household'})
category2 = Category.new({ 'type' => 'food'})
category3 = Category.new({ 'type' => 'drink'})
category4 = Category.new({ 'type' => 'car'})
category5 = Category.new({ 'type' => 'entertainment'})

category1.save()
category2.save()
category3.save()
category4.save()
category5.save()


merchant1 = Merchant.new({ 'name' => 'Sainsburys'})
merchant2 = Merchant.new({ 'name' => 'Tesco'})
merchant3 = Merchant.new({ 'name' => 'Garage'})
merchant4 = Merchant.new({ 'name' => 'Ocean Terminal'})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

transaction1 = Transaction.new({ 'category_id' => category1.id, 'merchant_id' => merchant1.id})
transaction2 = Transaction.new({ 'category_id' => category2.id, 'merchant_id' => merchant2.id})
transaction3 = Transaction.new({ 'category_id' => category3.id, 'merchant_id' => merchant1.id})
transaction4 = Transaction.new({ 'category_id' => category4.id, 'merchant_id' => merchant3.id})
transaction5 = Transaction.new({ 'category_id' => category5.id, 'merchant_id' => merchant4.id})
transaction6 = Transaction.new({ 'category_id' => category5.id, 'merchant_id' => merchant1.id})
transaction7 = Transaction.new({ 'category_id' => category5.id, 'merchant_id' => merchant2.id})
transaction8 = Transaction.new({ 'category_id' => category2.id, 'merchant_id' => merchant4.id})
transaction9 = Transaction.new({ 'category_id' => category1.id, 'merchant_id' => merchant2.id})


transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()







