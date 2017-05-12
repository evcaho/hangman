require 'sinatra'
require './word_generator'

	enable :sessions

def store_name(filename, string)
	File.open(filename, "a+") do |file|
		file.puts(string)
	end
end

def read_names
	return [] unless File.exist?("names.txt")
	File.read("names.txt").split("\n")
end


get '/' do
 	hangman = Hangmanword.new()
 	word = hangman.secret_word
 	@name = params["name"]
 	@names = read_names
 	store_name("names.txt", @name)
	erb :index, :locals => {:word => word}
end

