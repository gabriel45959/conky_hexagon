require("cairo")
require("lunajson")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local clock ={}
local config_clock = {
	{
		x = 385,
		y = 283,
		info = {
			{
				data = "${time %A}",
				color = { 0xf0b036, 1 },
				font_size = 27,
				x = 36,
				y = -100,
				z = 0,
			},
			{
				data = "${time %d} ${time  %B} ${time %Y}",
				color = { 0xFFFFFF, 0.7 },
				font_size = 20,
				x = 163,
				y = -60,
				z = 0,
			},
			{
				data = "${exec lsb_release -d | cut -d ':' -f 2 | tr  -d '[:blank:]'}",
				color = { 0xffffff, 0.9 },
				font_size = 15,
				x = 247,
				y = 40,
				z = 0,
			},
			{
				data = "${kernel}",
				color = { 0xffffff, 0.7 },
				font_size = 18,
				x = 45,
				y = 65,
				z = 0,
			},
			{
				data = "${addr enp3s0}",
				color = { 0xEEE8AA, 1 },
				font_size = 18,
				x = 65,
				y = 110,
				z = 0,
			},
		},
		clock_center = {
			diameter = 15,
			edge_color = { 0x000000, 1 },
			line_width_edge = 1,
			fill = 1,
			width = 0,
			rotate = 90,
		},
		hours = {
			diameter = 15,
			edge_color = { 0xd65600, 0.7 },
			line_width_edge = 1,
			fill = 1,
			width = 0,
			rotate = 90,
		},
		minutes = {
			diameter = 15,
			edge_color = { 0x81d64b, 0.7 },
			line_width_edge = 1,
			fill = 1,
			width = 0,
			rotate = 90,
		},
		seconds = {
			diameter = 15,
			edge_color = { 0xaeb3b3, 1 }, --{0xb20900,1},
			line_width_edge = 2,
			fill = 0,
			width = 0,
			rotate = 90,
		},
	},
}

--dibujo y posiciono las manecillas del reloj
local function hand_clock(cr, time, values, number_hexagon, type_hand, type_translate)
	local i = 1
	local translate = 0
	cairo_rotate(cr, time)
	while i <= number_hexagon do
		cairo_translate(cr, (values[type_translate]["diameter"] + 3.5), 0)
		--hexagon(cr, values[type_hand])
    draw_shapes.hexagon(cr,values[type_hand])
		translate = translate + (values[type_translate]["diameter"] + 3.5)
		i = i + 1
	end
	cairo_translate(cr, -translate, 0)
	cairo_rotate(cr, -time)
end
--calcular posicion del texto dentro del reloj
local function calc_position_text_clock(data_value)
	local text
	if data_value["data"]:sub(1, 1) == "$" then
		text = (string.len(conky_parse(data_value["data"])) / 2) * 10
	-- print(conky_parse(data_value['data']).." "..string.len(conky_parse(data_value['data'])).." text:"..text)
	else
		text = ((string.len(data_value["data"]) / 2) * 10)
		-- print((data_value['data']).." "..string.len((data_value['data'])).." text:"..text)
	end

	data_value["z"] = -text
	return data_value["x"] - text
end

function clock.draw()

	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	local values = config_clock[1]
	cairo_translate(cr, values["x"], values["y"])
	draw_shapes.hexagon(cr, values["clock_center"])

	--posicion y visualizacion del texto dentro del reloj
	for i in pairs(values["info"]) do
		if values["info"][i]["z"] == 0 then
			values["info"][i]["x"] = calc_position_text_clock(values["info"][i])
		end

		tools.show_text(cr, values["info"][i], values["info"][i]["data"])
	end
	cairo_stroke(cr)
	--calculo de la posicion de las horas
  local	hours = tools.angle_to_position_clock(12, tonumber(os.date("%H")) - 24)
	hand_clock(cr, hours, values, 4, "hours", "hours")
	--calculo de la posicion de los minutos
	local minutes = tools.angle_to_position_clock(60, tonumber(os.date("%M")))
	hand_clock(cr, minutes, values, 5, "minutes", "hours")

	--calculo de la posicion de los segundos
	local seconds = tools.angle_to_position_clock(60, (tonumber(os.date("%S")))) -- se suma 1 por el tiempo de acutalizacion de conky
	hand_clock(cr, seconds, values, 6, "seconds", "seconds")

	cairo_destroy(cr)
end
return clock
