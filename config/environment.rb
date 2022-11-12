# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/sequel'
require 'sequel'

Bundler.require(:default, ENV['SINATRA_ENV'])

# Establish the database connection; or, omit this and use the DATABASE_URL
# environment variable as the connection string:
set :database, "sqlite://db/#{ENV['SINATRA_ENV']}.db"

Sequel::Model.plugin :json_serializer

require_all 'app'
# this is
