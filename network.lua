
require("cairo")
require("lunajson")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local network = {}
local config_net = {
	{
		x = 106,
		y = 243,
		title = {
			text = "${addr A}",
			color = { 0xFFFFFF, 0.8 },
			font_size = 15,
			x = 57,
			y = -15,
		},
		hexagon_edge = {
			diameter = 85,
			edge_color = { 0xd65600, 0.8 },
			line_width_edge = 3,
			fill = 0,
			width = 100,
			rotate = 90,
		},
		hexagon_background = {
			diameter = 75,
			edge_color = { 0xd65600, 0.3 },
			line_width_edge = 1,
			fill = 1,
			width = 100,
			rotate = 90,
		},
		command = {
			{
				x = 1,
				y = 9,
				text_color = { 0xffffff, 1 },
				font_size = 13,
				distance_between_text = 75,
				title = "",
				command = "${totaldown A}",
			},
			{
				x = 1,
				y = 20,
				text_color = { 0xffffff, 1 },
				font_size = 13,
				distance_between_text = 75,
				title = "",
				command = "${totalup A}",
			},
			{
				x = -10,
				y = 9,
				text_color = { 0xffffff, 1 },
				font_size = 13,
				distance_between_text = 45,
				title = "Down:",
				command = "${downspeed A}",
			},
			{
				x = -10,
				y = 20,
				text_color = { 0xffffff, 1 },
				font_size = 13,
				distance_between_text = 45,
				title = "Up:",
				command = "${upspeed A}",
			},
		},
	},
}

function network.draw(name_net,positionX, positionY)
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	local values = config_net[1]

  values["title"]["text"] = string.gsub(values["title"]["text"],"A",name_net)
  for i in pairs(values["command"]) do
    values["command"][i]["command"] = string.gsub(values["command"][i]["command"],"A",name_net)
  end

	cairo_translate(cr, positionX+values["x"], positionY+values["y"])
	--HEXAGON
	--hexagon(cr, values["hexagon_edge"]) --edge
  draw_shapes.hexagon(cr, values["hexagon_edge"])
	--hexagon(cr, values["hexagon_background"]) --background
  draw_shapes.hexagon(cr, values["hexagon_background"])
	--TITLE
	tools.show_text(cr, values["title"], values["title"]["text"])
	--PROCESS
	tools.command_edge_motion(cr, values)

--	cairo_stroke(cr)
	cairo_destroy(cr)
end
return network
