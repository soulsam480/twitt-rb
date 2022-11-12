# frozen_string_literal: true

# users controller
class UsersController < Sinatra::Base
  configure do
    set :default_content_type, :json
  end

  helpers Session

  get '/users/:id' do
    authenticated

    MultiJson.dump(User.find(id: params['id']).all.to_json)
  end
end
