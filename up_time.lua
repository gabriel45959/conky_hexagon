
require("cairo")
require("lunajson")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local up_time = {}
local config_up_time = {
	{
		x = 310,
		y = 70,
		title = {
			text = "UPTIME",
			color = { 0xFFFFFF, 1 },
			font_size = 25,
			x = 30,
			y = -8,
		},
		hexagon_edge = {
			diameter = 90,
			edge_color = { 0x0139ff, 1 },
			line_width_edge = 2,
			fill = 0,
			width = 150,
			rotate = 90,
		},
		hexagon_background = {
			diameter = 80,
			edge_color = { 0xB0C4DE, 0.2 },
			line_width_edge = 1,
			fill = 1,
			width = 150,
			rotate = 90,
		},
		command = {
			{
				x = 7,
				y = 24,
				text_color = { 0xffffff, 1 },
				font_size = 24,
				distance_between_text = 0,
				title = "",
				command = "${uptime}",
			},
		},
	},
}

function up_time.draw()
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	cairo_translate(cr, config_up_time[1]["x"], config_up_time[1]["y"])

  draw_shapes.hexagon(cr,config_up_time[1]["hexagon_background"])
  draw_shapes.hexagon(cr,config_up_time[1]["hexagon_edge"])
	--TITLE
	tools.show_text(cr, config_up_time[1]["title"], config_up_time[1]["title"]["text"])

	--COMMANDS
	if config_up_time[1]["command"] ~= nil then
		tools.command_edge_motion(cr, config_up_time[1])
	end

--	cairo_stroke(cr)
	cairo_destroy(cr)
end

return up_time

