# Turn a list of terms into a seeds.rb file for populating the DB

# Steps

# 1. read the tab separated list file into an array. Terms are \n separated.
# 2. randomize array.
# 3. assign groups - 10 groups.
# 4. start writing each element of the array into a seeds.rb file. Probably going to be pretty large.

## Card.delete_all
##
## Card.create!(
##   field1: 'value',
##   field2: 'value'
## )
##

require 'open-uri'
require 'net/http'


=begin
def generate_seeds

  file = ARGV[0]
  group = ARGV[1]

  cards = []
  shuffled_cards = []

  Card = Struct.new(:term, :meaning)

  File.open(file) do |file|
    file.each do |line|
      term, meaning = line.chomp.split("\t")
      cards << Card.new(term, meaning)
    end
  end

  shuffled_cards = cards.shuffle

  file = File.new("seeds.rb","a")

  #file.puts "Card.delete_all"

  cards.each {|card| 
    google_meaning = get_google_meaning
    file.puts "Card.create!("
    file.puts "  group_id: '#{group}',"
    file.puts "  term: \'#{card.term}\',"
    file.puts "  meaning: \'#{card.meaning}\',"
    file.puts "  g_meaning: \'#{google_meaning}\',"  
    file.puts "  done: 'false'"
    file.puts ")"
  }
  file.close
end
=end

def get_google_definition(term)
  url = "http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=#{term}&sl=en&tl=en&restrict=pr%2Cde&client=te"
  uri = URI(url)
  res = Net::HTTP.get_response(uri)


  puts res.body
end

get_google_definition("tacit")
