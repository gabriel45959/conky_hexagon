
local tools = {}
--calculo de la posicion para las manecillas del reloj
function tools.angle_to_position(angle)
  return angle*math.pi/180
end
--- calcula el angulo para las manesillas del reloj
-- @tparam start_angle
-- @tparam current_angle
-- @return number
function tools.angle_to_position_clock(start_angle, current_angle)
	return ((current_angle * (2 * math.pi / start_angle)) - (math.pi / 2))
end
function tools.hex_to_rgba(tcolour)
	local colour, alpha = tcolour[1], tcolour[2]
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function tools.show_text(cr, v, text)
	cairo_move_to(cr, v["x"]-((v["font_size"]/2)*(string.len(text)/2)), v["y"])
	local font_type = "Courier New Regular"
	if text:sub(1, 1) == "$" then
		text = conky_parse(text)
	end

	if v["font_type"] ~= nil then
		font_type = v["font_type"]
	end
	cairo_select_font_face(cr, font_type, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
	cairo_set_font_size(cr, v["font_size"])
	cairo_set_source_rgba(cr, tools.hex_to_rgba(v["color"]))
	cairo_show_text(cr, text)
	cairo_stroke(cr)
end
function tools.command_edge_motion(cr, values)
	for i in pairs(values["command"]) do
		local x = values["command"][i]["x"]
		local y = values["command"][i]["y"]

		cairo_move_to(cr, x, y)
		cairo_set_source_rgba(cr, tools.hex_to_rgba(values["command"][i]["text_color"]))
		cairo_set_font_size(cr, values["command"][i]["font_size"])
		if values["command"][i]["title"] ~= nil then
			cairo_show_text(cr, values["command"][i]["title"])
			cairo_move_to(cr, x + values["command"][i]["distance_between_text"], y)
		end
		cairo_show_text(cr, conky_parse(values["command"][i]["command"]))
	end
end
function tools.top_hexagon_edge_motion(cr, values)
	local i = 1
	local x = values["top"]["x"]
	local y = values["top"]["y"]
	while i <= values["top"]["number_of_process"] do
		cairo_move_to(cr, x, y)
		cairo_set_font_size(cr, values["top"]["font_size"])
		cairo_set_source_rgba(cr, tools.hex_to_rgba(values["top"]["color"]))
		cairo_show_text(cr, conky_parse("${" .. values["top"]["name"] .. " " .. i .. "}"):gsub("%s+", ""))
		cairo_move_to(cr, x + values["top"]["distance_between_text"], y)
		cairo_show_text(cr, conky_parse("${" .. values["top"]["process"] .. " " .. i .. "}") .. "%")
		y = y - values["top"]["distance_between_line"]
		i = i + 1
	end
end
function tools.color_procentage_process(values)
	local data = tonumber(conky_parse(values["percentage"]["process"]))
	local k = 1

	if data <= 20 then
		k = 1
	elseif data <= 50 then
		k = 2
	elseif data <= 80 then
		k = 3
	else
		k = 4
	end

	return k
end

function tools.add_space_to_not_move(s)
	local j = 0
	for i in s:gmatch("(.)") do
		j = j + 1
	end
	if j == 1 then
		s = "    " .. s
	end
	if j == 2 then
		s = "  " .. s
	end
	return s
end

return tools
