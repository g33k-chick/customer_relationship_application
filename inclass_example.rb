# words = %w(first second third fourth fifth sixth)
# words.each do |word|
# 	word.reverse!
# end
# words = words.reverse!
# puts words.to_s

# or

# words.reverse!.each{ |word| word.reverse! } #or even words.each
# puts words.to_s

# movies = [['Alfonso Curson', 'Gravity'], ['Spike Jonze', 'Her'], ['Martin Scorsese', 'The Wolf of Wall Street']]

# result = movies.to_h
# puts result.to_s

File.open('new_stuff.txt','a') do |file_out|
	File.open('stuff.txt','r').each_line do |line|
		file_out.puts line
	end
end

