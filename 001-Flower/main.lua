Ladyparts = require "ladyparts"

function love.load()
	love.window.setMode( 600, 600 )
	width, height = love.graphics.getDimensions()
	canvas = love.graphics.newCanvas()
	radius = 200
	angle = 0
	segments = 20
	speed = 750;
	canvas:renderTo(function()
		love.graphics.setColor( 255, 200, 200 )
		love.graphics.rectangle( "fill", 0, 0, width, height )
	end)
end

function love.update( dt )
	canvas:renderTo(
		function()
			if ( radius > 0 ) then
				love.graphics.translate(width/2,height/2)
				for i = 0, speed do
					local r = (radius + Ladyparts.map(love.math.noise( angle * 10 ), 0, 1, -radius/segments*2, radius/segments*2 )) / segments
					angle = angle + 0.005 
					local x = math.cos( angle ) * r 
					local y = math.sin( angle ) * r
					local tx, ty = 0, 0 
					radius = radius - 0.01
					for j = 0, segments do
						love.graphics.setColor( j * ( 24 / segments ) + 222, j * ( 70 / segments ) + 137, j * ( 53 / segments ) + 190, 255 )
						local lx = tx
						local ly = ty
						tx = tx + x
						ty = ty + y
						love.graphics.line( lx, ly, tx, ty)
					end
				end
			end
		end
	)
end

function love.draw()
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.draw( canvas, 0, 0 )
end

