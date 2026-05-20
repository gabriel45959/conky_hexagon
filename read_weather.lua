local json = require("lunajson")
local http = require("socket.http")

local read_weather = {}
local weather_file = "/home/gabriel/conky_hexagon/weather.json"

local function get_weather()
  local json_data, code = http.request(
  "https://api.open-meteo.com/v1/forecast?latitude=-34.9033&longitude=-56.1882&daily=uv_index_max,sunrise,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,precipitation_probability_max,daylight_duration,sunset,uv_index_clear_sky_max,weather_code&current=temperature_2m,weather_code,precipitation,wind_speed_10m,relative_humidity_2m,wind_direction_10m,apparent_temperature,wind_gusts_10m,surface_pressure,is_day&timezone=auto")
  local fileweather = io.open(weather_file, "w")
  fileweather:write(json_data)
  fileweather:close()
end

local function read_file()
  local fileweather = io.open(weather_file, "r")
  local text_file
  if not fileweather then
    get_weather()
    fileweather = io.open(weather_file, "r")
  end
  if fileweather ~= nil then
    text_file = fileweather:read("*a")
  end
  if text_file:find("html", 1, true) ~= nil or string.len(text_file) <= 3 then
    text_file = "{\"error\": \"error de load weather\", \"time\":0}"
  end
  fileweather:close()
  return text_file
end
local function save_check_weather(weather_json)
  local fileweather = io.open(weather_file, "w")
  fileweather:write(weather_json)
  fileweather:close()
end
local function refresh_file_weather(dataJson)
  
  if dataJson.error ~= nil then
    if dataJson.time ~= os.date("%M") then
      get_weather()
      dataJson = json.decode(read_file())
      dataJson.time = os.date("%M")
      save_check_weather(json.encode(dataJson))
      print("busco de nuevo weather api, por error ocurrido")
    end
  else
    if dataJson.current.time ~= os.date("%H") then
      get_weather()
      dataJson = json.decode(read_file())
      dataJson.current.time = os.date("%H")
      save_check_weather(json.encode(dataJson))
      print("busco de nuevo weather api")
    end
  end
end
function read_weather.current()
  --local is_time_update_data = false
  local image_weather = "/home/gabriel/conky_hexagon/imagenes/"
  local tableReturn = {}
  local dataJson = json.decode(read_file())
  if dataJson.error ~= nil then
    print("error encontrado")
    tableReturn["error"] = 1
    refresh_file_weather(dataJson)
  else
    refresh_file_weather(dataJson)
    tableReturn["error"] = 0
    tableReturn["temperature"] = dataJson.current.temperature_2m
    tableReturn["temperature_max"] = dataJson.daily.temperature_2m_max[1]
    tableReturn["temperature_min"] = dataJson.daily.temperature_2m_min[1]
    tableReturn["temperature_max_min"] = dataJson.daily.temperature_2m_max[1] .. " / " ..
        dataJson.daily.temperature_2m_min[1]

    tableReturn["weather_code"] = dataJson.current.weather_code
    tableReturn["wind_speed"] = dataJson.current.wind_speed_10m
    tableReturn["relative_humidity"] = dataJson.current.relative_humidity_2m
    tableReturn["wind_direction"] = dataJson.current.wind_direction_10m
    tableReturn["is_day"] = dataJson.current.is_day
    tableReturn["apparent_temperature"] = dataJson.current.apparent_temperature
    tableReturn["surface_pressure"] = dataJson.current.surface_pressure
    tableReturn["temperature_unit"] = dataJson.current_units.temperature_2m
    tableReturn["temperature_max_unit"] = dataJson.daily_units.temperature_2m_max
    tableReturn["temperature_min_unit"] = dataJson.daily_units.temperature_2m_min
    tableReturn["wind_speed_unit"] = dataJson.current_units.wind_speed_10m
    tableReturn["relative_humidity_unit"] = dataJson.current_units.relative_humidity_2m
    tableReturn["apparent_temperature_unit"] = dataJson.current_units.apparent_temperature
    tableReturn["wind_direction_unit"] = dataJson.current_units.wind_direction_10m
    tableReturn["surface_pressure_unit"] = dataJson.current_units.surface_pressure
    --tableReturn["is_time_update_data"] = is_time_update_data
    tableReturn["weather_image"] = image_weather .. dataJson.current.weather_code .. "_" ..
    dataJson.current.is_day .. ".png"
    tableReturn["daily_time"] = dataJson.daily.time
    tableReturn["daily_weather_code"] = dataJson.daily.weather_code
    tableReturn["daily_uv_index_max"] = dataJson.daily.uv_index_max
    tableReturn["daily_temperature_max"] = dataJson.daily.temperature_2m_max
    tableReturn["daily_temperature_min"] = dataJson.daily.temperature_2m_min
    tableReturn["daily_temperature_max_unit"] = dataJson.daily_units.temperature_2m_max
    tableReturn["daily_temperature_min_unit"] = dataJson.daily_units.temperature_2m_min
  end

  return tableReturn
end

return read_weather
