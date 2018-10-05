function love.load()
	love.window.setMode( 600, 600 )
	width, height = love.graphics.getDimensions()
	a = 0
	r = 200
	triangles = {}
	timer = 0
	canvas = love.graphics.newCanvas()
	love.graphics.setLineWidth( 4 )
	canvas:renderTo(function()
		love.graphics.setColor( 255/255, 200/255, 200/255 )
		love.graphics.rectangle( "fill", 0, 0, width, height )
	end)
end

function love.update( dt )
	timer = timer + dt
	if ( timer >= 1 / 16 ) then
		a = a + math.pi / 16
		local points = {}
		for i = 1, 3 do
			local x = math.cos( a ) * r
			local y = math.sin( a ) * r
			table.insert( points, { x = x + width / 2, y = y + width / 2 } )
			a = a + math.pi * 2 / 3
		end
		canvas:renderTo(function()
			love.graphics.setColor( 255/255, 200/255, 200/255, 50/255 )
			love.graphics.rectangle( "fill", 0, 0, width, height )
			love.graphics.setColor( 1, 1, 1 )
			love.graphics.line( points[1].x, points[1].y, points[2].x, points[2].y )
			love.graphics.line( points[2].x, points[2].y, points[3].x, points[3].y )
			love.graphics.line( points[3].x, points[3].y, points[1].x, points[1].y )
		end)
		timer = 0
	end

end

function love.draw()
	love.graphics.setColor( 1, 1, 1 )
	love.graphics.draw( canvas )
end

