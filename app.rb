require 'rubygems'
require 'bundler/setup'

# myapp.rb
require 'sinatra'
require 'json'

get '/' do
  output = "<h2>Gemfile</h2><pre>"
  output += File.read(File.join(__dir__, "Gemfile"))
  output += "</pre>"
  output += "<h2>Environment</h2><pre>"
  ENV.sort.each do |key, val|
    output += "#{key}=\"#{val}\"\n"
  end
  output += "</pre>"
  output
end
