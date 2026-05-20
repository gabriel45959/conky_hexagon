require("cairo")
require("lunajson")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local disk = {}

function disk.draw(partition, positionX, positionY)
	local config_disk = {
		{
			x = 0,
			y = 0,
			hexagon_rotate = 90,
			title = {
				text = "/",
				color = { 0xFFFFFF, 1 },
				font_size = 15,
				x = 45,
				y = -5,
			},
			hexagon_edge = {
				diameter = 83,
				edge_color = { 0xd65600, 1.5 },
				line_width_edge = 2,
				fill = 0,
				width = 100,
				rotate = 90,
			},
			hexagon_background = {
				diameter = 73,
				edge_color = { 0xd65600, 0.3 },
				line_width_edge = 1,
				fill = 1,
				width = 100,
				rotate = 90,
			},
			command = {
				{
					x = -55,
					y = 15,
					text_color = { 0xffffff, 1 },
					font_size = 13,
					distance_between_text = 55,
					title = "",
					command = "${fs_used_perc D}%  ${fs_used D}/${fs_size D}",
				},
			},
		},
	}
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	local values = config_disk[1]
	cairo_translate(cr, positionX + values["x"], positionY + values["y"]) --, values["y"])
	values["command"][1]["command"] = string.gsub(values["command"][1]["command"], "D", partition)
	values["command"][1]["title"] = string.gsub(values["command"][1]["title"], "D", partition)
	values["title"]["text"] = partition
	--values["title"]["x"] = values["title"]["x"]-(7*(string.len(partition)/2))
	--HEXAGON
	draw_shapes.hexagon(cr, values["hexagon_edge"]) --edge
	draw_shapes.hexagon(cr, values["hexagon_background"]) --background
	--TITLE
	tools.show_text(cr, values["title"], values["title"]["text"])
	--PROCESS
	--print(values["command"][1]["command"].." "..partition)
	tools.command_edge_motion(cr, values)
	cairo_stroke(cr)

	--values["title"]["x"] = values["title"]["x"]+(7*(string.len(partition)/2))
	--	cairo_translate(cr, 94, 0)
	--
	--
	--	values = config_disk[2]
	--	cairo_translate(cr, values["x"], values["y"])
	--	--HEXAGON
	--	--hexagon(cr, values["hexagon_edge"]) --edge
	--  draw_shapes.hexagon(cr, values["hexagon_edge"])
	--	--cairo_translate(cr, 100, 0)
	--	--hexagon(cr, values["hexagon_background"]) --background
	--  draw_shapes.hexagon(cr, values["hexagon_background"])
	--	cairo_translate(cr, -5, 0)
	--	--TITLE
	--	tools.show_text(cr, values["title"], values["title"]["text"])
	--	--PROCESS
	--	tools.command_edge_motion(cr, values)
	----	cairo_stroke(cr)
	--	cairo_destroy(cr)
end

return disk
