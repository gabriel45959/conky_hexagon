#!/usr/bin/lua5.1
local background = require("conky_hexagon.background")
local disk_mem_net = require("conky_hexagon.disk_mem_net")
local disk_cpu_net = require("conky_hexagon.disk_cpu_net")
local up_time = require("conky_hexagon.up_time")
--local mem = require("conky_hexagon.mem")
local cpu = require("conky_hexagon.cpu")
local network = require("conky_hexagon.network")
local disk = require("conky_hexagon.disk")
local clock = require("conky_hexagon.clock")
local date_clock_kernel = require("conky_hexagon.date_clock_kernel")
local weather = require("conky_hexagon.weather")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local function draw_arrow()
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)
	cairo_destroy(cr)
end
--funcion para conky
function conky_draw_clock()
	if conky_window == nil then
		return
	end
	local cr = cairo_create(
		cairo_xlib_surface_create(
			conky_window.display,
			conky_window.drawable,
			conky_window.visual,
			conky_window.width,
			conky_window.height
		)
	)

	disk_mem_net.draw(cr)
	disk_cpu_net.draw(cr)
	date_clock_kernel.draw(cr)
	cairo_destroy(cr)

	--  background.draw()
	--	up_time.draw()
	--	mem.draw()
	--	cpu.draw()
	--	network.draw()
	--	disk.draw()
	--  clock.draw()
	--	weather.draw()

	--	if update_conky > 1 then
	--	end
end

--funcion para conky
function conky_image_weather()
	return "${image ~/conky_hexagon/imagenes/lluvia.png" .. " -p 280,520 -s 180x180}"
end

function conky_shutdown()
	print("now print - shutdown")
end

function conky_startup()
	print("now print startup")
end

function conky_startup_post()
	--print("now print startup_post")
end
