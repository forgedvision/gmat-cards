#http://stackoverflow.com/questions/7958302/split-seeds-rb-file
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
