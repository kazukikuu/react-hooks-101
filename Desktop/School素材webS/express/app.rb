require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'sinatra/activerecord'
require './models'




get '/list' do
  History.create!(x: params[:x],y: params[:y])

  uri = URI("http://express.heartrails.com/api/json")
  uri.query = URI.encode_www_form({
    method: "getStations",
   x: params[:x],
   y: params[:y]
  })
  res = Net::HTTP.get_response(uri)
  json = JSON.parse(res.body)
  @stations = json["response"]["station"]
  erb :list
end

get '/api/station' do
  uri = URI("http://express.heartrails.com/api/json")
  uri.query = URI.encode_www_form({
    line: params[:line],
    name: params[:name]
  })
  res = Net::HTTP.get_response(uri)
  json = JSON.parse(res.body)
  response = {
     next: json["response"]["station"][0]["next"]
  }
  json response
end

get '/' do
  @histories = History.all
  @favorites = History.where(favorite: true)
  erb :form
end

post '/:id/delete' do
  history = History.find(params[:id])
  history.delete
  redirect "/"
end

post '/:id/update' do
  history = History.find(params[:id])
  history.favorite = !history.favorite
  history.save
  redirect "/"
end