require 'pp'

@orig = [[1, 1, 0],[0, -1, 1],[1, 1, 1]]
#@orig = [[1, 1, 1],[1, -1, 2],[-1, 1, 3]]
@f = []
@e = []
@n = 3

def dot(a, b)
	res = 0
	a.each_with_index do |item, i|

		res += item * b[i]
	end
	res
end
 
def multi(arr, multi)
	new_arr = arr.map do |item|
		item * multi
	end
	new_arr
end

def sub(a,b)
	new_arr = []
	a.each_with_index do |item, i|
		new_arr.push(item - b[i])
	end
	new_arr
end

def get_len(arr)
	len = 0
	arr.each do |item|
		len += (item ** 2)
	end	
	len = len ** 0.5
end
 
@f[0] = @orig[0]
 
(0...@n).each do |i|
	 
	len = get_len(@f[i])
	r = 1 / len
	@e[i] = multi(@f[i], r)
									 
	if i < (@n - 1)
		substracted = @orig[i + 1]
		(0..i).each do |ii|
			dotted = dot(@orig[i + 1], @e[ii])
			multiplied = multi(@e[ii], dotted)
			substracted = sub(substracted, multiplied)
		end
		
		@f[i + 1] = substracted
	end
end
 
@e.each do |row|
	sum = 0
	row.each do |elem|
		sum += (elem ** 2)
	end
	len = Math.sqrt sum
	#len must be 1
	pp len.round(2)
end
dot1 = dot(@e[0], @e[1])
dot2 = dot(@e[0], @e[2])
dot3 = dot(@e[1], @e[2])
 
#dot must be 0
pp dot1.round(3)
pp dot2.round(3)
pp dot3.round(3)





