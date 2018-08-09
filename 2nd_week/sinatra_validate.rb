require './common'
require 'sinatra'

get '/' do
  erb :index
end

post '/save' do
  # インスタンス変数はerbと共有出来る仕様
  @headline = Headline.new
  @headline.title = params[:title]
  @headline.save
  erb :save
end
