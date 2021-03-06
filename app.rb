require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:pizzaria.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end	

get '/articles' do
	erb :articles
end	

get '/contacts' do
	erb :contacts
end	

get '/cart' do
	erb "cart"
end	

post '/cart' do	
	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	@items.each do |item|
		# id, count
		item[0] = Product.find(item[0])
	end

	erb :cart
end	

get '/place_order' do
	erb "test"
end	

post '/place_order' do
	@order = Order.create params[:order_input]
	erb :order_placed
end	

def parse_orders_input orders_input

	s1 = orders_input.split(/,/)
	arr = []

	s1.each do |x|
		s2 = x.split(/=/)
		s3 = s2[0].split(/_/)
		id = s3[1]
		count = s2[1]
		arr2 = [id, count]
		arr.push arr2
	end

	return arr
end
