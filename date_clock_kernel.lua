require("cairo")
local draw_shapes = require("conky_hexagon.draw_shapes")
local clock = require("conky_hexagon.clock")
local date_clock_kernel = {}

local config_background = {
	{
		x = 0,
		y = 0,
		background_hexagon = {
			{ --centro
				x = -230,
				y = 131,
				diameter = 300,
				edge_color = { 0xEEE8AA, .2 },
				line_width_edge = 3,
				fill = 1,
				width = 0,
				rotate = 90,
			},
		},
	},
}
function date_clock_kernel.draw(cr_p)
--	local cr = cairo_create(
--		cairo_xlib_surface_create(
--			conky_window.display,
--			conky_window.drawable,
--			conky_window.visual,
--			conky_window.width,
--			conky_window.height
--		)
--	)
	local values = config_background[1]["background_hexagon"]
	cairo_translate(cr_p, values["x"], values["y"])
	cairo_translate(cr_p, values[1]["x"], values[1]["y"])
  draw_shapes.hexagon(cr_p,values[1])
	--cairo_destroy(cr_p)
  clock.draw()
end
return date_clock_kernel
