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


  file = ARGV[0].to_s
  puts file
  group = file.scan(/\d+/).last
  puts group
  group_name = file.split("/").last.scan(/\D+/).last.to_s
  puts group_name

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

  file = File.new("#{group}_#{group_name}.rb","a")

  #file.puts "Card.delete_all"

  file.puts "Group.create!("
  file.puts "  name: \'#{group_name}\'"
  file.puts ")"

  cards.each {|card| 
    file.puts "Card.create!("
    file.puts "  group_id: '#{group}',"
    file.puts "  term: \'#{card.term}\',"
    file.puts "  meaning: \'#{card.meaning}\',"
    file.puts "  done: 'false'"
    file.puts ")"
  }
  file.close

