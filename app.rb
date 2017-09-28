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
