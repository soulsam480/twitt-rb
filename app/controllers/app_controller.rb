# frozen_string_literal: true

require './config/environment'
require 'multi_json'
require_relative '../helpers/session'

# main app service
class AppController < Sinatra::Base
  configure do
    enable :sessions
    set :default_content_type, :json
  end

  get '/' do
    'Hello world'
  end
end
