health = 100
mob_data = []
player_data = []
sword_data = []

@inventory = []

mobs = []
mobs = Dir.entries("data/mobs")
mobs.reverse!.pop(2)
mobs.each do |file|
	file.chomp!(".txt")
end

mobs_length = mobs.length
number = Random.rand(0..mobs_length-1) #going to long -1?
mob_selection = mobs.fetch(number)
mob = mob_selection

File.open("data/mobs/#{mob_selection}.txt", "r") do |f|
	f.each_line do |data|
		mob_data << data
	end
end

mob_health = mob_data[0].to_i
min_damage = mob_data[1].to_i
max_damage = mob_data[2].to_i
miss = mob_data[3].to_i
mob_desc = mob_data[4]


File.open("data/player/player_data.txt", "r") do |f|
	f.each_line do |data|
		player_data << data
	end
end

player_health = player_data[0].to_i
player_minD = player_data[1].to_i
player_maxD = player_data[2].to_i
player_miss = player_data[3].to_i


File.open("data/items/sword.txt", "r") do |f|
	f.each_line do |data|
		sword_data << data
	end
end

sword_durability = sword_data[0]
sword_minD = sword_data[1]
sword_macD = sword_data[2]
sword_miss = sword_data[3]

#
#
#


=begin
File.open("data/drops/goblin.txt").each_line do |l|
	@goblin_drops << l
end
=end

puts "#{mob} has appeared!"
puts mob_desc
until mob_health <= 0 or health == 0
puts "Pick your poison! (aka 'attack' is the only command available)" 
choice = gets.chomp.downcase
exit if choice=="91535"

if choice == "attack"
	#player
	hit_chance = Random.rand(1..100)
	number = Random.rand(player_minD..player_maxD)
	if hit_chance >= player_miss
		puts "attack mixed"
	else
		puts "You hit #{number}"
		mob_health = mob_health - number
	end

#mob
	hit_chance = Random.rand(1..100)
	mob_damage = Random.rand(min_damage..max_damage)

	if hit_chance >= miss  #check the miss logic
			puts "#{mob} attack mixed!"  #lots mob stuff below this point
	else
		puts "#{mob} hit #{mob_damage}"
		health = health - mob_damage
	end

	puts "#{mob} has #{mob_health}"
	puts "You have #{health} health"
else
	puts "invalid cookie"
end 

puts ""
end  #until loop end

puts "Your health!"
puts health

puts "#{mob} health"
puts mob_health


