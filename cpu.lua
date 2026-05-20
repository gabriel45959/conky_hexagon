
require("cairo")
require("lunajson")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local cpu = {}
local config_cpu = {
	{
		x = 525,
		y = 155,
		hexagon_rotate = 90,
		title = {
			text = "CPU",
			color = { 0xFFFFFF, 1 },
			font_size = 25,
			x = 80,
			y = -18,
		},
		percentage = {
			process = "${cpu}",
			color = { 0xFFFFFF, 1 },
			font_size = 30,
			x = 170,
			y = 25,
		},
		hexagon_edge = {
			diameter = 105,
			edge_color = { 0x07b60a, 0.3 },
			line_width_edge = 2,
			fill = 0,
			width = 180,
			rotate = 90,
		},
		hexagon_background = {
			diameter = 100,
			edge_color = { 0x07b60a, 0.1 },
			line_width_edge = 1,
			fill = 1,
			width = 180,
			rotate = 90,
		},
		change_color = {
			colors = {
				--verde
				{ color = { 0x07b60a, 0.4 } },
				--amarillo
				{ color = { 0xfdff00, 0.6 } },
				--naranja
				{ color = { 0xfbc621, 0.7 } },
				--rojo
				{ color = { 0xff0000, 1 } },
			},
		},
		top = {
			number_of_process = 4,
			name = "top name",
			process = "top cpu",
			font_size = 10.0,
			color = { 0xFFFFFF, 1 },
			distance_between_line = 10,
			distance_between_text = 120,
			x = -22,
			y = 30,
		},
	},
}

function cpu.draw()
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	local values = config_cpu[1]
	cairo_translate(cr, values["x"], values["y"])
	--HEXAGON
	values["hexagon_edge"]["edge_color"] =
		{ values["change_color"]["colors"][tools.color_procentage_process(values)]["color"][1], 1 }
	--hexagon(cr, values["hexagon_edge"]) --edge
  draw_shapes.hexagon(cr, values["hexagon_edge"])
	values["hexagon_background"]["edge_color"] =
		values["change_color"]["colors"][tools.color_procentage_process(values)]["color"]
	draw_shapes.hexagon(cr, values["hexagon_background"]) --background
	--TITLE
	tools.show_text(cr, values["title"], values["title"]["text"])
	--PROCESS
	if values["top"] ~= nil then
		tools.top_hexagon_edge_motion(cr, values)
	end
	tools.show_text(cr, values["percentage"], tools.add_space_to_not_move(conky_parse(values["percentage"]["process"]) .. "%"))
--	cairo_stroke(cr)
	cairo_destroy(cr)
end
return cpu
