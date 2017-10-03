class CreateOrders < ActiveRecord::Migration[5.1]
  def change
  	create_table :orders do |o|
  	  o.text	:orders_input
  	  o.string	:name
  	  o.string	:phone
  	  o.text	:address
  	  o.timestamps
  	end  	
  end
end
