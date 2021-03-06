module Geometry
	def perimeter
		sides.reduce(:+)
	end
end

class Rectangle
	include Geometry

	def	initialize(length, width)
		@length = length
		@width = width
	end

	def sides
		[@length, @width, @length, @width]
	end
end

class Square
	include Geometry
	def initialize(side)
		@side = side
	end

	def sides
		[@side, @side, @side, @side]
	end
end

class Triangle
	include Geometry
	def initialize(size)
		@size = size
	end
	def sides
		[@side, @side, @side]
	end
end