require_relative 'config/environment'
require 'securerandom'

class App < Sinatra::Base
 @@secret = SecureRandom.hex(64)

    get '/sess' do
      @session = session 
    end 

    configure do 
        enable :sessions
        set :session_secret, @@secret
    end 

    get '/' do 
      erb :index 
    end 

    post '/checkout' do 
      session[:item] = params[:item]
      p "#{session[:item]}"  
    end


end