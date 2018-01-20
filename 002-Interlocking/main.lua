require "helper"

function love.load()

	setMode( 600, 600 )
	canvas = newCanvas()
	angle1 = 0
	angle2 = 0
	maxR = width/2 - 100
	minR = 100
	sides = 5
	size = 20
	perFrame = 10
	speed = 0.0025
	offset = math.pi
	canvas:renderTo(function()
		setColor( 255, 200, 200 )
		rectangle( "fill", 0, 0, width, height )
	end)
	colors = { { 222, 137, 190 }, { 164, 80, 139 }, { 115, 75, 94 }, { 234, 191, 203 } }

end

function love.update( dt )

end

function love.draw()

	canvas:renderTo(function()

		for i = 0, perFrame do
			push()
			angle1 = angle1 + speed
			translate( width/2, height/2 )
			local radius = map(sin(angle1*sides), -1, 1, minR, maxR)
			local x = cos( angle1 ) * radius
			local y = sin( angle1 ) * radius
			setColor( colors[2] )
			rectangle( "fill", x - size/2, y - size/2, size, size )
			line( x +size/2, y-size/2, x+size/2, y+size/2)
			setColor( colors[3] )
			line( x -size/2, y+size/2, x+size/2, y+size/2)
			setColor( colors[4] )
			line( x -size/2, y-size/2, x-size/2, y+size/2)
			setColor( colors[1] )
			line( x -size/2, y-size/2, x+size/2, y-size/2)
			pop()

			push()
			angle2 = angle2 + speed
			translate( width/2, height/2 )
			rotate( offset )
			local radius = map(sin(angle2*sides), -1, 1, minR, maxR)
			local x = cos( angle2 ) * radius
			local y = sin( angle2 ) * radius
			setColor( colors[2] )
			rectangle( "fill", x - size/2, y - size/2, size, size )
			line( x -size/2, y-size/2, x-size/2, y+size/2)
			setColor( colors[3] )
			line( x -size/2, y-size/2, x+size/2, y-size/2)
			setColor( colors[4] )
			line( x +size/2, y-size/2, x+size/2, y+size/2)
			setColor( colors[1] )
			line( x -size/2, y+size/2, x+size/2, y+size/2)
			pop()
		end

	end)
	setColor( 255, 255, 255 )
	draw( canvas )

end
