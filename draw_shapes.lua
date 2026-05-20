local tools = require("conky_hexagon.tools")
local draw_shapes = {}

--dibujo del hexagono
function draw_shapes.hexagon(cr, values)
	local line_width = values["line_width_edge"]
	local width = values["width"]
	local fill = values["fill"]
	local color = values["edge_color"]
	local Diameter = values["diameter"]
	local i = 0
	local point_hexagon = {
		{ x = math.sqrt(3) * Diameter / 4., y = Diameter / 4. },
		{ x = 0, y = Diameter / 2. },
		{ x = -math.sqrt(3) * Diameter / 4., y = Diameter / 4. }, --
		{ x = -math.sqrt(3) * Diameter / 4., y = -Diameter / 4. - width },
		{ x = 0, y = -Diameter / 2. - width },
		{ x = math.sqrt(3) * Diameter / 4., y = -Diameter / 4. - width }, --
		{ x = math.sqrt(3) * Diameter / 4., y = Diameter / 4. },
	}
	cairo_set_line_width(cr, line_width)
	cairo_rotate(cr, tools.angle_to_position(values["rotate"]))
	while i + 1 <= #point_hexagon do
		cairo_set_source_rgba(cr, tools.hex_to_rgba(color)) --color
		cairo_line_to(cr, point_hexagon[i + 1].x, point_hexagon[i + 1].y)
		i = i + 1
	end
	cairo_close_path(cr)
	if fill == 1 then
		cairo_fill(cr)
	else
		cairo_set_fill_rule(cr)
		cairo_stroke(cr)
	end
	cairo_rotate(cr, tools.angle_to_position(-1 * tonumber(values["rotate"])))
	--	cairo_rotate(cr, tools.angle_to_position(values["rotate"], 180))
end

function draw_shapes.arrow(cr, high, width, angle, x, y, color)
	local half_high = high / 2
	local half_width = width / 2
	cairo_set_source_rgba(cr, tools.hex_to_rgba(color)) --color
	cairo_translate(cr, x, y)
	cairo_rotate(cr, tonumber(tools.angle_to_position(angle)))
	cairo_line_to(cr, -half_width, 0)
	cairo_line_to(cr, 0, -half_high)
	cairo_line_to(cr, half_width, 0)
	cairo_line_to(cr, half_width / 2, 0)
	cairo_line_to(cr, half_width / 2, half_high)
	cairo_line_to(cr, -half_width / 2, half_high)
	cairo_line_to(cr, -half_width / 2, 0)
	cairo_line_to(cr, -half_width, 0)
	cairo_close_path(cr)
	cairo_fill(cr)
	cairo_rotate(cr, -1 * tonumber(tools.angle_to_position(angle)))

	cairo_translate(cr, -1 * tonumber(x), -1 * tonumber(y))
end

return draw_shapes
