# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'tableimport.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Stock.new
  t.symbol = row['Symbol']
  t.name = row['Name']
  t.industry = row['Industry']
  t.rank = row['Rank']
  t.mom = row['Mom']
  t.pe = row['Pe']
  t.pb = row['Pb']
  t.div = row['Div']
  t.ps = row['Ps']
  t.save
  puts "#{t.symbol}, #{t.name} saved"
end

puts "There are now #{Stock.count} rows in the stocks table"
