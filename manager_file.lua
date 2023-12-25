json = require 'lunajson'

local manager_file={}


function read_weather(file_weather)
    local tableReturn = {}
    local fileweather = io.open(file_weather,"r")


    if fileweather ~= nil then

        local readfile = fileweather:read("*a")
        fileweather:close()

	if readfile:sub(1,1) ~= '{' then
	   return nil
	end


        local dataJson = json.decode(readfile)
        
        tableReturn["FeelsLikeC"]=dataJson.current_condition[1].FeelsLikeC
        tableReturn["humidity"]=dataJson.current_condition[1].humidity
        tableReturn["observation_time"]=dataJson.current_condition[1].observation_time
        tableReturn["precipMM"]=dataJson.current_condition[1].precipMM
        tableReturn["temp_C"]=dataJson.current_condition[1].temp_C
        tableReturn["uvIndex"]=dataJson.current_condition[1].uvIndex
        tableReturn["visibility"]=dataJson.current_condition[1].visibility
        tableReturn["weatherCode"]=dataJson.current_condition[1].weatherCode
        tableReturn["weatherDesc"]=dataJson.current_condition[1].weatherDesc[1].value
        tableReturn["winddir16Point"]=dataJson.current_condition[1].winddir16Point
        tableReturn["windspeedKmph"]=dataJson.current_condition[1].windspeedKmph
        tableReturn["moon_illumination"]=dataJson.weather[1].astronomy[1].moon_illumination
        tableReturn["moon_phase"]=dataJson.weather[1].astronomy[1].moon_phase
        tableReturn["sunset"]=dataJson.weather[1].astronomy[1].sunset
        tableReturn["sunrise"]=dataJson.weather[1].astronomy[1].sunrise
        tableReturn["maxtempC"]=dataJson.weather[1].maxtempC
        tableReturn["mintempC"]=dataJson.weather[1].mintempC
        tableReturn["sunHour"]=dataJson.weather[1].sunHour
    
    end 

    return tableReturn
end

return manager_file
