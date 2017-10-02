require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


set :database, "sqlite3:pizzaria.db"

class Product < ActiveRecord::Base
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
	erb :cart
end	

post '/cart' do	
	orders_input = params[:orders]
	@orders = parse_orders_input orders_input
	erb :cart
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
