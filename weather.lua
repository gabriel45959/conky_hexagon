require("cairo")
require("lunajson")
local read_weather = require("conky_hexagon.read_weather")
local tools = require("conky_hexagon.tools")
local draw_shapes = require("conky_hexagon.draw_shapes")
local weather = {}
local config_weather = {
  {
    info = {
      {
        data = "temperature",
        color = { 0xf0b036, 1 },
        font_size = 50,
        x = 270,
        y = -55,
      },
      {
        data = "apparent_temperature",
        color = { 0xEEE8AA, 1 },
        font_size = 20,
        x = 300,
        y = -105,
      },
      {
        data = "relative_humidity",
        color = { 0x0011FF, 1 },
        font_size = 15,
        x = 400,
        y = -105,
      },
      {
        data = "wind_speed",
        color = { 0x0011ff, 1 },
        font_size = 15,
        x = 370,
        y = 0,
      },
      {
        data = "wind_direction",
        color = { 0x0011ff, 1 },
        font_size = 15,
        x = 450,
        y = -20,
      },
      {
        data = "surface_pressure",
        color = { 0x0011ff, 1 },
        font_size = 15,
        x = 250,
        y = 0,
      },
      {
        data = "temperature_max",
        color = { 0xEEE8AA, 1 },
        font_size = 25,
        x = 250,
        y = -25,
      },
      {
        data = "temperature_min",
        color = { 0x0011ff, 1 },
        font_size = 25,
        x = 360,
        y = -25,
      },
    },
    title = {
      {
        title = "ST",
        color = { 0x000000, 1 },
        font_size = 10,
        x = 280,
        y = -105,
      },
      {
        title = "H",
        color = { 0x000000, 1 },
        font_size = 10,
        x = 379,
        y = -105,
      },
      {
        title = "/",
        color = { 0x000000, 0.8 },
        font_size = 25,
        x = 345,
        y = -25,
      },
      {
        title = "PS",
        color = { 0x000000, 1 },
        font_size = 10,
        x = 235,
        y = 0,
      },
    },
  },
}

function weather.draw()
  local values = config_weather[1]
  local cr_image = cairo_create(
    cairo_xlib_surface_create(
      conky_window.display,
      conky_window.drawable,
      conky_window.visual,
      conky_window.width,
      conky_window.height
    )
  )
  local cr_text = cairo_create(
    cairo_xlib_surface_create(
      conky_window.display,
      conky_window.drawable,
      conky_window.visual,
      conky_window.width,
      conky_window.height
    )
  )
  local cr_icon = cairo_create(
    cairo_xlib_surface_create(
      conky_window.display,
      conky_window.drawable,
      conky_window.visual,
      conky_window.width,
      conky_window.height
    )
  )
  cairo_translate(cr_image, 520, 412)
  --cairo_translate(cr, 350, -250)
  local data_weather
  data_weather = read_weather.current()
  if data_weather["error"] == 1 then
    print("Error encontrado no load weather")
  else
    --image weather
    local image = cairo_image_surface_create_from_png(data_weather["weather_image"])
    local w = cairo_image_surface_get_width(image)
    local h = cairo_image_surface_get_height(image)
    cairo_scale(cr_image, 180.0 / w, 180.0 / h)
    cairo_set_source_surface(cr_image, image, 0, 0)
    cairo_paint(cr_image)
    cairo_surface_destroy(image)
    -- text
    cairo_translate(cr_text, 250, 435)
    draw_shapes.arrow(cr_text, 20, 8, tonumber(data_weather["wind_direction"]), 470, -5, { 0x000000, 1 })
    for i in pairs(values["info"]) do
      tools.show_text(
        cr_text,
        values["info"][i],
        data_weather[values["info"][i]["data"]] .. data_weather[values["info"][i]["data"] .. "_unit"]
      )
    end
    for i in pairs(values["title"]) do
      tools.show_text(cr_text, values["title"][i], values["title"][i]["title"])
    end
    -- icon
    cairo_translate(cr_icon, 590, 420)
    local image_icon_wind = cairo_image_surface_create_from_png("/home/gabriel/conky_hexagon/imagenes/icons_wind.png")
    local w_icon = cairo_image_surface_get_width(image_icon_wind)
    local h_icon = cairo_image_surface_get_height(image_icon_wind)
    cairo_scale(cr_icon, 025.0 / w_icon, 020.0 / h_icon)
    cairo_set_source_surface(cr_icon, image_icon_wind, 0, 0)
    cairo_paint(cr_icon)
    cairo_surface_destroy(image_icon_wind)
    cairo_destroy(cr_image)
    cairo_destroy(cr_text)
    cairo_destroy(cr_icon)
  end
end

return weather
