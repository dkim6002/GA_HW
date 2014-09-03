require 'sinatra'
require 'sinatra/reloader'
require 'oauth'
require 'json'

enable :sessions

CLIENT_KEY = 'QY1yD7qaHmDFL0ZfSjrO8QjQt'
CLIENT_SECRET = 'kNADViJIb5ehW0Yxs0dnm5CCE1q1zbFeeCEDJzw0W3Gy8OS8fE'

get '/' do 
	puts @oauth.inspect
	erb :index
end

get '/get-request-token' do
	request_token = @oauth.get_request_token(:oauth_callback => 'http://127.0.0.1:4567//callback')
	session[:token] = request_token.token
	session[:secret] = request_token.secret
	redirect request_token.authorize_url
end

before do
	@oauth = OAuth::Consumer.new(CLIENT_KEY, CLIENT_SECRET, {site: 'https://api.twitter.com'})
end

get '/callback' do
	request_token = OAuth::RequestToken.new(@oauth, session[:token], session[:secret])
	access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
	session[:access_token] = access_token
	redirect '/tweets'
end

get '/tweets' do
	raw_data = @oauth.request(:get, '/1.1/statuses/home_timeline.json', session[:access_token], {:scheme => :query_string})

	@tweets = JSON.parse(raw_data.body)
	erb :tweets
end
