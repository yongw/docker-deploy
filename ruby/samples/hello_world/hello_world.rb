require 'sinatra'
require 'json'
require 'pp'


set :server, %w[webrick thin mongrel]

get '/hello' do
  content_type :json
  result = {result: 'hello world!'}
  result.to_json
end


