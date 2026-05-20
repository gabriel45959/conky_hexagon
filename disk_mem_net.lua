require("cairo")
local draw_shapes = require("conky_hexagon.draw_shapes")
local mem = require("conky_hexagon.mem")
local disk = require("conky_hexagon.disk")
local net = require("conky_hexagon.network")
local disk_mem_net = {}

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
		},
	},
}
function disk_mem_net.draw(cr_p)
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
	cairo_translate(cr_p, values["x"], values["y"])
	cairo_translate(cr_p, values[1]["x"], values[1]["y"])
	draw_shapes.hexagon(cr_p, values[1])
	mem.draw()
	disk.draw("/", values[1]["x"] - 50, values[1]["y"] - 88)
	net.draw("enp3s0", 0, 0)
	cairo_destroy(cr)
end

return disk_mem_net
