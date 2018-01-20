map = function( val, min, max, bmin, bmax )
	return ( ( val - min ) / ( max - min ) ) * ( bmax - bmin ) + bmin
end

distance = function( x1, y1, x2, y2 )
	return math.sqrt( math.pow( x1 - x2, 2 ) + math.pow( y1 - y2, 2 ) )
end

setMode = function( w, h, flags )
	love.window.setMode( w, h, flags )
	width, height = love.graphics.getDimensions()
end

circle = love.graphics.circle
cos = math.cos
draw = love.graphics.draw
line = love.graphics.line
lineWidth = love.graphics.setLineWidth
mouseX = love.mouse.getX
mouseY = love.mouse.getY
newCanvas = love.graphics.newCanvas
newImage = love.graphics.newImage
noise = love.math.noise
pointSize = love.graphics.setPointSize
points = love.graphics.points
polygon = love.graphics.polygon
pop = love.graphics.pop
printText = love.graphics.print
push = love.graphics.push
random = love.math.random
randomNormal = love.math.randomNormal
rectangle = love.graphics.rectangle
rotate = love.graphics.rotate
setBackgroundColor = love.graphics.setBackgroundColor
setColor = love.graphics.setColor
sin = math.sin
translate = love.graphics.translate
width, height = love.graphics.getDimensions()
