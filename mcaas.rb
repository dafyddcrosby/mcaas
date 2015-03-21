require 'sinatra'
require 'marky_markov'

get '/' do
  "Welcome to MCaaS"
end

get '/demo/:add' do
  markov = MarkyMarkov::Dictionary.new('dictionary') # Saves/opens dictionary.mmd
  markov.parse_string(params[:add])
  markov.save_dictionary!
  return markov.generate_n_sentences 5
end
