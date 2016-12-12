require 'pp'
 
#@orig = [[6,5,4],[12,13,10],[18,21,17]]
#@orig = [[10,15,24],[12,133,100],[11,1,15]]
@orig = [[22,5,30],[10,13,2],[20,3,13]]
@u = [[0,0,0],[0,0,0],[0,0,0]]
@l = [[1,0,0],[0,1,0],[0,0,1]]
@n = 3

#------------------------------
# get_u
#------------------------------
def get_u i,j
  k = 0
	new_u = 0
	 
  while k < i + 1 do
    if k == 0
			 
      new_u = @orig[i][j]
			 
    else
			 
			new_u -=  @l[i][k - 1] * @u[k - 1][j] 
			 
    end

    k += 1
  end
	 
	@u[i][j] = new_u
end
 
#------------------------------
# get_l
#------------------------------
def get_l i,j
	 
  k = 0
	new_l = 0
	 
  while k < i + 1 do
		 
    if k == 0
			 
      new_l = @orig[i][j] / @u[j][j]
			 
    else
			 
			new_l -= (@l[i][k - 1] * @u[k - 1][j]) / @u[j][j]
			 
    end
		 
    k += 1
  end
	 
	@l[i][j] = new_l
end

#------------------------------
# main
#------------------------------
(0...@n).each do |i|
  (i...@n).each do |j|
    get_u i,j
  end
	 
  (i+1...@n).each do |j|
    get_l j,i
  end
end

pp "u = #{@u}"
pp "l = #{@l}"
