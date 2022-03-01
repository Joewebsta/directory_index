# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  file_paths = Dir.glob('public/*')
  @files = file_paths.map { |file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == 'desc'
  erb :list
end
