#ref http://dora.bk.tsukuba.ac.jp/~takeuchi/?%E7%B7%9A%E5%BD%A2%E4%BB%A3%E6%95%B0%EF%BC%A9%2F%E8%A6%81%E7%82%B9%2F%EF%BC%88%E3%82%B0%E3%83%A9%E3%83%A0%EF%BC%89%E3%82%B7%E3%83%A5%E3%83%9F%E3%83%83%E3%83%88%E3%81%AE%E7%9B%B4%E4%BA%A4%E5%8C%96%E6%B3%95#i5088b82
 
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





