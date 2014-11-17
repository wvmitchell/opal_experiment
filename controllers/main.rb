get '/' do
  haml :index
end

get '/colors.json' do
  { colors: ['yellow',
             'green',
             'blue',
             'red',
             'black',
             'purple'] }.to_json
end

get '/test_params' do
  binding.pry
  person = params["name"]
  { alert: "Here\'s an alert #{person}!" }.to_json
end
