require 'csv'
 
csv_text = File.read('new.csv')
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|                                       
    puts "#{row['en']}\t#{row['no']}\t#{row['description']}"
end
