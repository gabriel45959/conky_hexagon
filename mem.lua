require("cairo")
require("lunajson")
local draw_shapes = require("conky_hexagon.draw_shapes")
local tools = require("conky_hexagon.tools")
local mem = {}
local config_mem = {
  {
    x = 65,
    y = 155,
    hexagon_rotate = 90,
    title = {
      text = "MEMORIA",
      color = { 0xFFFFFF, 1.3 },
      font_size = 25,
      x = 65,
      y = -19,
    },
    percentage = {
      process = "${memperc}",
      color = { 0xFFFFFF, 1 },
      font_size = 30,
      x = 160,
      y = 30,
    },
    mem = {
      title = {
        text = "mem: ",
        color = { 0xFFFFFF, 1.3 },
        font_size = 15,
        x = 120,
        y = -5,
      },
      process = "${mem}/${memmax}",
      color = { 0xFFFFFF, 1.3 },
      font_size = 13,
      x = 180,
      y = -5,
    },
    swap = {
      title = {
        text = "swap: ",
        color = { 0xFFFFFF, 1.3 },
        font_size = 15,
        x = -20,
        y = -5,
      },
      process = "${swap}/${swapmax}",
      color = { 0xFFFFFF, 1 },
      font_size = 12,
      x = 26,
      y = -5,
    },
    top = {
      number_of_process = 4,
      name = "top_mem name",
      process = "top_mem mem",
      font_size = 10.0,
      color = { 0xFFFFFF, 1 },
      distance_between_line = 10,
      distance_between_text = 100,
      x = -23,
      y = 39,
    },
    hexagon_edge = {
      diameter = 105,
      edge_color = { 0x07b60a, 0.9 },
      line_width_edge = 2,
      fill = 0,
      width = 180,
      rotate = 90,
    },
    hexagon_background = {
      diameter = 100,
      edge_color = { 0x0038ff, 0.15 },
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
        { color = { 0xfdff00, 0.3 } },
        --naranja
        { color = { 0xff8100, 0.5 } },
        --rojo
        { color = { 0xff0000, 1 } },
      },
    },
  },
}

function mem.draw()
  local cr = cairo_create(
    cairo_xlib_surface_create(
      conky_window.display,
      conky_window.drawable,
      conky_window.visual,
      conky_window.width,
      conky_window.height
    )
  )
  local values = config_mem[1]
  cairo_translate(cr, values["x"], values["y"])
  --HEXAGON
  values["hexagon_edge"]["edge_color"] =
  { values["change_color"]["colors"][tools.color_procentage_process(values)]["color"][1], 1 }
  --	hexagon(cr, values["hexagon_edge"]) --edge
  draw_shapes.hexagon(cr, values["hexagon_edge"])
  values["hexagon_background"]["edge_color"] =
      values["change_color"]["colors"][tools.color_procentage_process(values)]["color"]
  --hexagon(cr, values["hexagon_background"]) --background
  draw_shapes.hexagon(cr, values["hexagon_background"])
  --TITLE
  tools.show_text(cr, values["title"], values["title"]["text"])
  --PROCESS
  if values["top"] ~= nil then
    tools.top_hexagon_edge_motion(cr, values)
  end
  tools.show_text(
    cr,
    values["percentage"],
    tools.add_space_to_not_move(conky_parse(values["percentage"]["process"]) .. "%")
  )
  tools.show_text(cr, values["mem"]["title"], values["mem"]["title"]["text"])
  tools.show_text(cr, values["mem"], tools.add_space_to_not_move(conky_parse(values["mem"]["process"])))
  tools.show_text(cr, values["swap"]["title"], values["swap"]["title"]["text"])
  tools.show_text(cr, values["swap"], tools.add_space_to_not_move(conky_parse(values["swap"]["process"])))
  --	cairo_stroke(cr)
  cairo_destroy(cr)
end

return mem
