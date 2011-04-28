require 'rubygems'

# If you're using bundler, you will need to add this
require 'bundler/setup'

require 'sinatra'

get '/' do
  "Hello world, it's #{Time.now} at the server!"
end

get '/bob' do
  "Jim"
end

get '/jim' do
  "Bob"
end

get '/eat-lunch' do
  "Bob and Jim"
end