lp = require "ladyparts"

function love.load()

	love.window.setMode( 600, 600 )
	width, height = love.graphics.getDimensions()
	canvas = love.graphics.newCanvas()
	shader = love.graphics.newShader[[
	vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){

		vec4 pixel = Texel(texture, texture_coords );
		number g = mod( pixel.g * 255.0 , 2.0 );
		if ( g < 0.5 ) {

			return vec4( 1.0, 0.7843, 0.7843, 1.0 );

		} else {
			return pixel * color;
		}

	}
	]]

	show = true
	record = true
	count = 0

	circles = {}
	table.insert( circles, { x = width / 2, y = height / 2, r = 150, a = 150 + height / 2, off = 0 } )
	for i = 1, 20 do 
		local r = love.math.random( 25, 100 )
		table.insert( circles, { x = love.math.random( r, width - r), y = love.math.random( -height*8, -height ), r = r, a = lp.map( love.math.random(), 0, 1, 0.1, 0.2 ), off = 0 } )
	end

end

function love.keypressed( key )

	if ( key == "s" ) then

		show = not show

	end

	if ( key == "r" ) then

		record = not record

	end

end

function love.draw()

	canvas:renderTo(function()

		love.graphics.setColor( 222, 137, 190 )
		love.graphics.rectangle( "fill", 0, 0, width, height )
		if ( record ) then
			love.graphics.setColor( 255, 255, 255, 3 )
			love.graphics.circle( "fill", width / 2, height / 2, 150 )
			for i, v in ipairs( circles ) do

				if ( i == 1 ) then

					v.y = v.a % ( height + v.r * 2 ) - v.r
					v.a = lp.map( math.abs( lp.clamp( math.sin( v.off ), -0.7, 0.7 ) ) , 0, 0.7, 450, 1350 )
					v.off = v.off + 0.005
					if ( v.off >= 1 ) then

						v.off = 0

					end

				else

					v.y = v.y + v.off
					v.off = v.off + v.a

				end

				love.graphics.circle( "fill", v.x, v.y, v.r )

			end
		end
		--love.graphics.rectangle( "fill", love.mouse.getX() - 50, love.mouse.getY() - 50, 100, 100 )

	end)
	if ( show ) then
		love.graphics.setShader( shader )
	end
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.draw( canvas )
	love.graphics.setShader()

	--if ( record ) then

	--	if ( count % 2 == 0 ) then
	--		local str = count - 1
	--		if ( count < 10 ) then str = "00"..count - 1 end
	--		if ( count >= 10 and count < 99 ) then str = "0"..count-1 end
	--		local screenshot = love.graphics.newScreenshot();
	--		screenshot:encode('png', str .. '.png')
	--		local str = count
	--		if ( count < 10 ) then str = "00"..count end
	--		if ( count >= 10 and count < 99 ) then str = "0"..count end
	--		local screenshot = love.graphics.newScreenshot();
	--		screenshot:encode('png', str .. '.png')
	--	end
	--	love.graphics.setColor(255,0,0)
	--	love.graphics.circle("fill",10,10,10)
	--	count = count + 1

	--end

end
