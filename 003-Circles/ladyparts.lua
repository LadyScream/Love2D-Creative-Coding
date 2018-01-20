--MIT License
--
--Copyright (c) 2017 - LadyScream https://github.com/LadyScream
--
--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all
--copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--SOFTWARE.

local ladyparts = { _version = "0.0.1" }

function ladyparts.map( val, min, max, bmin, bmax )
	return ( ( val - min ) / ( max - min ) ) * ( bmax - bmin ) + bmin
end

function ladyparts.distance( x1, y1, x2, y2 )
	return math.sqrt( math.pow( x1 - x2, 2 ) + math.pow( y1 - y2, 2 ) )
end

function ladyparts.inRange( value, min, max )
	return ( value >= math.min( min, max ) and value <= math.max( min, max ) )
end

function ladyparts.rangeIntersect( min1, max1, min2, max2 )
	return math.max( max1, min1 ) > math.min( min2, max2 ) and math.min( min1, max1 ) < math.max( max2, min2 )
end

function ladyparts.lerp( s, e, t )
	return s + t * ( e - s )
end

function ladyparts.linesIntersect( a, b, c, d )
	return ladyparts.ccw( a, c, d) ~= ladyparts.ccw( b, c, d ) and ladyparts.ccw( a, b, c ) ~= ladyparts.ccw( a, b, d )
end

function ladyparts.ccw( a, b, c )
	return (c.y-a.y) * (b.x-a.x) > (b.y-a.y) * (c.x-a.x)
end

function ladyparts.clamp( val, min, max )
	if ( val < min ) then val = min end
	if ( val > max ) then val = max end
	return val
end

return ladyparts
