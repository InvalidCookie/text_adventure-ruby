puts "What name would you like to call your mob?"
mob_name = gets.chomp
puts "What is the mobs health?"
mob_health = gets.chomp
puts "What is the damage range? example: 3-7 would do 3 to 7 damage randomly"
mob_range = gets.chomp
puts "What is the chance to miss?(out of 100) so a 40 would be 40% chance to miss"
mob_miss = gets.chomp
puts "What is the mob description?"
mob_desc = gets.chomp

mob_range = mob_range.split("-")
mob_minD = mob_range[0]
mob_maxD = mob_range[1]

File.open("data/mobs/#{mob_name}.txt", 'w+') do |f|
	f.puts mob_health
	f.puts mob_minD
	f.puts mob_maxD
	f.puts mob_miss
	f.puts mob_name
end

puts "completed"