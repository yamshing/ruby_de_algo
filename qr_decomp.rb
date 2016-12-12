#reference code from http://souzousha.iinaa.net/www/NumericalAnalysis/JavaSrc/0203/QRDecomp.java
require 'pp'

@orig = [[1,-2,2],[-2,1,1],[-2,1,2]]
@q = [[0,0,0],[0,0,0],[0,0,0]]
@r = [[0,0,0],[0,0,0],[0,0,0]]
@n = 3
 
(0...@n).each do |k|
	x = []
	(0...@n).each do |i|
		x[i] = @orig[i][k]
	end
	(0..k-1).each do |j|
		rjk = 0
		(0...@n).each do |i|
			rjk += @orig[i][k] * @q[i][j];
		end
		@r[j][k] = rjk; 
		@r[k][j] = 0;
		(0...@n).each do |i|
			x[i] -= rjk * @q[i][j]
		end
	end
	t = 0
	(0...@n).each do |i|
		t += x[i] * x[i]
	end

	@r[k][k] = Math.sqrt(t)

	(0...@n).each do |j|
		@q[j][k] = x[j] / @r[k][k];
	end
	pp @q
	pp @r
end
 
