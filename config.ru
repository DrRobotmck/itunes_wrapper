require 'rubygems'

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'httparty'
require 'pry'

API_ROOT = 'https://itunes.apple.com/search?'

get '/' do
	["<h1>The API has the following endpoints:</h1>",
		"<p><strong>/api/search_for_artist -> parameter of 'artist' must be provided</strong></p>",
		"<p><strong>/api/search_for_artist_tracks -> parameter of 'artist' must be provided</strong></p>",
		"<p><strong>/api/search_for_songs -> parameter of 'song' must be provided</strong></p>",
		"<p><strong>/api/search_for_apps -> parameter of 'app' must be provided</strong></p>"
		].join("\n")

end

get '/api/search_for_artist' do
	query = [ API_ROOT, 'term=', params[:artist], '&limit=20', '&entity=musicArtist' ].join
	results = HTTParty.get(URI.escape(query))
	json JSON.parse(results)
end

get '/api/search_for_artist_tracks' do
	query = [ API_ROOT, 'term=', params[:artist], '&limit=20', '&entity=musicTrack' ].join
	results = HTTParty.get(URI.escape(query))
	json JSON.parse(results)
end

get '/api/search_for_songs' do
	query = [ API_ROOT, 'term=', params[:song], '&limit=20', '&entity=musicTrack' ].join
	results = HTTParty.get(URI.escape(query))
	json JSON.parse(results)
end

get '/api/search_for_apps' do
	query = [ API_ROOT, 'term=', params[:app], '&limit=20', '&entity=software' ].join
	results = HTTParty.get(URI.escape(query))
	json JSON.parse(results)
end

run Sinatra::Application