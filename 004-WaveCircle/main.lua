lp = require "ladyparts"

function love.load()

	love.window.setMode( 600, 600 )
	width, height = love.graphics.getDimensions()
	love.graphics.setBackgroundColor( 255, 200, 200 )
	canvas = love.graphics.newCanvas()
	radius = 200
	angle = 0
	minSize = 1
	maxSize = 20
	speed = 0.05
	step = 0.01
	circles = 50
	mult = .2
	repetitions = 10
	record = true

end

function color( index, x, y )

	--local c = 222 * index / circles
	local d = lp.distance( x, y, 0, 0 )
	local r, g, b
	r = lp.map( d, 0, radius, 122/4, 222 )
	g = lp.map( d, 0, radius, 89/4, 137 )
	b = lp.map( d, 0, radius, 128/4, 190 )
	return { r, g, b }

end

function love.keypressed( key )

	if ( key == "r" ) then

		record = not record

	end

end

function love.draw()

	canvas:renderTo( function()

		if ( record ) then

			love.graphics.clear()
			love.graphics.push()

			love.graphics.translate( width / 2, height / 2 )
			local off = 0
			for i = 1, circles do 

				R = math.sin( (off + angle) * mult ) * radius
				tmp = math.cos( angle * 1.5 )
				r = lp.map( i, 0, circles, minSize * tmp, maxSize * tmp )
				local x, y = math.cos( angle + off ) * R, math.sin( angle + off ) * R
				local d = lp.distance( x, y, 0, 0 )
				r = lp.map( d, 0, radius, minSize, maxSize )
				r = lp.map( math.sin( d/7 ), -1, 1, minSize, maxSize )
				love.graphics.setColor( color( i, x, y ) )
				love.graphics.circle( "fill", x, y, r )
				off = off + step

			end

			love.graphics.pop()
			angle = angle + speed

		end

	end)
	love.graphics.setColor( 255, 255, 255 )
	for i = 1, repetitions do

		love.graphics.draw( canvas, width/2, height/2, i * math.pi * 2 / repetitions, 1, 1, width/2, height/2 )

	end

end
