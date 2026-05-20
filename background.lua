require("cairo")
local draw_shapes = require("conky_hexagon.draw_shapes")
local background = {}

local config_background = {
	{
		x = 0,
		y = 0,
		background_hexagon = {
			{ --arriba izquierda
				x = 155,
				y = 155,
				diameter = 300,
				edge_color = { 0xDEB887, 0.5 },
				line_width_edge = 4,
				fill = 1,
				width = 0,
				rotate = 90,
			},
			{ --arriba derecha
				x = 460,
				y = 0,
				diameter = 300,
				edge_color = { 0x808080, 0.5 },
				line_width_edge = 1,
				fill = 1,
				width = 0,
				rotate = 90,
			},
			{ --centro
				x = -230,
				y = 138,
				diameter = 300,
				edge_color = { 0xEEE8AA, .5 },
				line_width_edge = 3,
				fill = 1,
				width = 0,
				rotate = 90,
			},
			{ --abajo derecha
				x = 230.0,
				y = 138,
				diameter = 300,
				edge_color = { 0xADD8E6, .5 },
				line_width_edge = 3,
				fill = 1,
				width = 0,
				rotate = 90,
			},
			{ --abajo izquierda
				x = -460.0,
				y = -0.2,
				diameter = 300,
				edge_color = { 0x40E0D0, .5 },
				line_width_edge = 3,
				fill = 1,
				width = 0,
				rotate = 90,
			},
			{ --blanco
				x = 230.0,
				y = 138.0,
				diameter = 300,
				edge_color = { 0xC0C0C0, .5 },
				line_width_edge = 3,
				fill = 1,
				width = 0,
				rotate = 90,
			},
		},
	},
}
function background.draw()
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	local values = config_background[1]["background_hexagon"]
	cairo_translate(cr, values["x"], values["y"])
	for i in pairs(values) do
		cairo_translate(cr, values[i]["x"], values[i]["y"])
    draw_shapes.hexagon(cr,values[i])
	end
	cairo_destroy(cr)
end
return background
