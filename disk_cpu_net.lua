require("cairo")
local draw_shapes = require("conky_hexagon.draw_shapes")
local cpu = require("conky_hexagon.cpu")
local disk = require("conky_hexagon.disk")
local net = require("conky_hexagon.network")
local disk_cpu_net = {}

local config_background = {
	{
		x = 0,
		y = 0,
		background_hexagon = {
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
		},
	},
}
function disk_cpu_net.draw(cr_p)
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
	cairo_translate(cr_p, config_background[1]["x"], config_background[1]["y"])
	cairo_translate(cr_p, values[1]["x"], values[1]["y"])
	draw_shapes.hexagon(cr_p, values[1])
	cpu.draw()
	disk.draw("/home/gabriel", values[1]["x"] + 105, 67)
	net.draw("enp3s0", 460, 0)
	cairo_destroy(cr)
end

return disk_cpu_net
