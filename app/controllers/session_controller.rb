# frozen_string_literal: true

# users controller
class SessionController < Sinatra::Base
  configure do
    set :default_content_type, :json
  end

  helpers Session

  post '/session/login' do
    request.body.rewind

    data = JSON.parse request.body.read

    session_login(data)

    redirect 'session/user'
  end

  post '/session/register' do
    request.body.rewind

    data = JSON.parse request.body.read

    user = User.new

    user['name'] = data['name']
    user['email'] = data['email']
    user['password'] = data['password']

    user.save

    session[:user_id] = user['id']
    user.to_json
  end

  get '/api/authenticated/user' do
    authenticated

    user = User.find(id: session_user_id)

    user
  end
  
end
