require 'opal'
require 'opal-jquery'
require 'sinatra'
require 'pry'

Dir[Dir.pwd + '/controllers/*'].each {|file| require file}

opal = Opal::Server.new {|s|
  s.append_path 'app'
  s.main = 'application'
}

map opal.source_maps.prefix do
  run opal.source_maps
end

map '/assets' do
  run opal.sprockets
end

run Sinatra::Application
