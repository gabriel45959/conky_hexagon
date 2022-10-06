require 'cairo'
require 'lunajson'
manager_file=require ('conky_hexagon.manager_file')

json_weather={}


config_edge_motion = {
    {
        x=425,    y=80,
        hexagon_rotate=90,
        title={
            text="UPTIME",
            color={0xFFFFFF,0.5},
            font_size=25,
            x=5,y=-15,
        },
        hexagon_edge={
            diameter=103,
            edge_color={0x01009f,0.7},
            line_width_edge=5,
            fill=0,
            width=100, 
        },
        hexagon_background={
            diameter=100,
            edge_color={0x0139ff,0.25},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter=95,
            edge_color={0x0139ff,1},
            line_width_edge=3,
            fill=0,
            width=100,
        },
        command={
            {
                 x=-15,y=15,
                 text_color={0xffffff,1},
                 font_size=25,
                 distance_between_text=0,
                 title="",
                 command="${uptime}",
             },
         },
    },
    {
        x=193,    y=52,
        hexagon_rotate=90,
        title={
            text="MEM",
            color={0xFFFFFF,.3},
            font_size=25,
            x=20,y=-15,
        },
        percentage ={
            process="${memperc}",
            color={0xFFFFFF,1},
            font_size=30,
            x=125,y=10,
        },
        hexagon_edge={
            diameter=105,
            edge_color={0x07b60a,.3},
            line_width_edge=2,
            fill=0,
            width=180,
        },
        hexagon_background={
            diameter=100,
            edge_color={0x0038ff,0.15},
            line_width_edge=1,
            fill=0,
            width=180,
        },
        hexagon_inside={
            diameter=95,
            edge_color={{0x07b60a,1}},
            line_width_edge=2,
            fill=0,
            width=180,
            degrade_edge_color={
                --verde
                {color={0x07b60a,0.4}},
                --amarillo
                {color={0xfdff00,0.6}},
                --naranja
                {color={0xff8100,0.7}},
                --rojo
                {color={0xff0000,1}},
            }
        },
        top={
            number_of_process=4,
            name="top_mem name",process="top_mem mem",
            font_size=10.0,
            color={0xFFFFFF,1},
            distance_between_line=10,
            distance_between_text=100,
            x=-20, y=30,
        },
    },
    {
        x=-193,    y=319,
        hexagon_rotate=90,
        title={
            text="DISK",
            color={0xFFFFFF,0.2},
            font_size=65,
            x=-27,y=25,
        },

        hexagon_edge={
            diameter=110,
            edge_color={0xFFFFFF,1},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=100,
            edge_color={0x0c8d00,0.2},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter=95,
            edge_color={0x0c8d00,1},
            line_width_edge=3,
            fill=0,
            width=100,
        },
        command={
           {
                x=-30,y=-15,
                text_color={0xffffff,1},
                font_size=13,
                distance_between_text=55,
                title="/",
                command="${fs_used_perc /}%  ${fs_used /}/${fs_size /}",
            },
            {
                x=-30,y=5,
                text_color={0xffffff,1},
                font_size=13,
                distance_between_text=55,
                title="DATA",
                command="${fs_used_perc /home/gabriel/DATA}%  ${fs_used /home/gabriel/DATA}/${fs_size /home/gabriel/DATA}",
            }
        },
    },
    {
        x=-275,    y=-319,
        hexagon_rotate=90,
        title={
            text="CPU",
            color={0xFFFFFF,0.4},
            font_size=25,
            x=32,y=-15,
        },
        percentage ={
            process="${cpu}",
            color={0xFFFFFF,1},
            font_size=30,
            x=125,y=10,
        },
        hexagon_edge={
            diameter=105,
            edge_color={0x07b60a,.3},
            line_width_edge=2,
            fill=0,
            width=180,
        },
        hexagon_background={
            diameter=100,
            edge_color={0x07b60a,0.1},
            line_width_edge=1,
            fill=1,
            width=180,
        },
        hexagon_inside={
            diameter=95,
            edge_color={{0x07b60a,1}},
            line_width_edge=3,
            fill=0,
            width=180,
            degrade_edge_color={
                --verde
                {color={0x07b60a,0.4}},
                --amarillo
                {color={0xfdff00,0.6}},
                --naranja
                {color={0xfbc621,0.7}},
                --rojo
                {color={0xff0000,1}},
            }
        },
        
        top={
            number_of_process=4,
            name="top name",process="top cpu",
            font_size=10.0,
            color={0xFFFFFF,1},
            distance_between_line=10,
            distance_between_text=120,
            x=-20, y=30,
        },
    },
    {
        x=40,    y=90,
        hexagon_rotate=90,
        title={
            text="${addr wlp3s0}",
            color={0xFFFFFF,0.5},
            font_size=15,
            x=7,y=-10,
        },
        hexagon_edge={
            diameter=85,
            edge_color={0xd65600,0.5},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=60,
            edge_color={0xd65600,0.3},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter=75,
            edge_color={0xd65600,1},
            line_width_edge=2,
            fill=0,
            width=100,
        },
        command={
           
            {
                x=5,y=9,
                text_color={0xffffff,1},
                font_size=13,
                distance_between_text=75,
                title="",
                command="${totaldown wlp3s0}",
            },
            {
               x=5,y=20,
               text_color={0xffffff,1},
               font_size=13,
               distance_between_text=75,
               title="",
               command="${totalup wlp3s0}",
           },
           {
               x=-10,y=9,
               text_color={0xffffff,1},
               font_size=13,
               distance_between_text=45,
               title="Down:",
               command="${downspeed wlp3s0}",
           },
           {
               x=-10,y=20,
               text_color={0xffffff,1},
               font_size=13,
               distance_between_text=45,
               title="Up:",
               command="${upspeed wlp3s0}",
           },
        },
    },
    {
        x=0,    y=-180,
        hexagon_rotate=90,
        title={
            text="/",
            color={0xFFFFFF,0.5},
            font_size=25,
            x=45,y=-5,
        },
        hexagon_edge={
            diameter=85,
            edge_color={0xd65600,0.5},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=60,
            edge_color={0xd65600,0.3},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter=75,
            edge_color={0xd65600,1},
            line_width_edge=2,
            fill=0,
            width=100,
        },
        command={
            {
                 x=-55,y=15,
                 text_color={0xffffff,1},
                 font_size=13,
                 distance_between_text=55,
                 title="",
                 command="${fs_used_perc /}%  ${fs_used /}/${fs_size /}",
             },
         },
    },
    {
        x=467,    y=0,
        hexagon_rotate=90,
        title={
            text="DATA",
            color={0xFFFFFF,0.5},
            font_size=25,
            x=15,y=-5,
        },
        hexagon_edge={
            diameter=80,
            edge_color={0x8F3B39,.5},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=60,
            edge_color={0x8F3B39,0.3},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter=75,
            edge_color={0x8F3B39,1},
            line_width_edge=2,
            fill=0,
            width=100,
        },
        command={
            {
                 x=-55,y=15,
                 text_color={0xffffff,1},
                 font_size=13,
                 distance_between_text=55,
                 title="",
                 command="${fs_used_perc /home/gabriel/DATA}%  ${fs_used /home/gabriel/DATA}/${fs_size /home/gabriel/DATA}",
             },
         },
    },
    {
        x=0,    y=179,
        hexagon_rotate=90,
        title={
            text="${addr enp2s0}",
            color={0xFFFFFF,0.5},
            font_size=15,
            x=7,y=-10,
        },
        hexagon_edge={
            diameter=85,
            edge_color={0xd65600,0.5},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=60,
            edge_color={0xd65600,0.3},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter=75,
            edge_color={0xd65600,1},
            line_width_edge=2,
            fill=0,
            width=100,
        },
        command={
           
            {
                x=5,y=9,
                text_color={0xffffff,1},
                font_size=13,
                distance_between_text=75,
                title="",
                command="${totaldown enp2s0}",
            },
            {
               x=5,y=20,
               text_color={0xffffff,1},
               font_size=13,
               distance_between_text=75,
               title="",
               command="${totalup enp2s0}",
           },
           {
               x=-10,y=9,
               text_color={0xffffff,1},
               font_size=13,
               distance_between_text=45,
               title="Down:",
               command="${downspeed enp2s0}",
           },
           {
               x=-10,y=20,
               text_color={0xffffff,1},
               font_size=13,
               distance_between_text=45,
               title="Up:",
               command="${upspeed enp2s0}",
           },
        },
    },
    --x=-825,    y=-238,
       
}
config_clock={
    {
        x=475,    y=265,
        edge_clock={
            diameter=300,
            edge_color={0x000015,0.5},
            line_width_edge=2,
            fill=0,
            width=0,
            rotate=90,
        },
        background_clock={
            { --rigth up
                x=233,y=-133,
                diameter=300,
                edge_color={0x0e2f05,0.5},
                line_width_edge=1,
                fill=1,
                width=0,
                rotate=90,   
            },
            { --rigth down
                x=0,y=269,
                diameter=300,
                edge_color={0xcad5cc,0},
                line_width_edge=1,
                fill=0,
                width=0,
                rotate=90,   
            },
            { --left up
                x=-468,y=-269,
                diameter=300,
                edge_color={0x000015,0.5},
                line_width_edge=1,
                fill=1,
                width=0,
                rotate=90,   
            },
            { --left down
                x=0,y=269,
                diameter=300,
                edge_color={0xcad5cc,0.01},
                line_width_edge=1,
                fill=1,
                width=0,
                rotate=90,   
            }

            
        },
        info={
            {
                data="${time %A}",
                color={0xf0b036,1},
                font_size=27,
                x=-7,y=-90,z=0,
            },
            {
                data="${time %d} ${time  %B} ${time %Y}",
                color={0xFFFFFF,.7},
                font_size=20,
                x=0,y=-60,z=0,
            },
            {
                data="${exec lsb_release -d | cut -d ':' -f 2 | tr  -d '[:blank:]'}",
                color={0xffffff,0.9},
                font_size=18,
                x=-5,y=40,z=0,
            },
            {
                data="${kernel}",
                color={0xffffff,0.7},
                font_size=18,
                x=5,y=65,z=0,
            },
            {
                data="${addr wlp3s0}",
                color={0xdfa418,0.8},
                font_size=18,
                x=0,y=90,z=0,
            },
            {
                data="${addr enp2s0}",
                color={0xdfa418,0.8},
                font_size=18,
                x=0,y=110,z=0,
            },
        },
        clock_center={
            diameter=15,
            edge_color={0x000000,1},
            line_width_edge=1,
            fill=1,
            width=0,
        },
        hours={
            diameter=15,
            edge_color={0xd65600,0.7},
            line_width_edge=1,
            fill=1,
            width=0,
        },
        minutes={
            diameter=15,
            edge_color={0x81d64b,0.7},
            line_width_edge=1,
            fill=1,
            width=0,
        },
        seconds={
            diameter=15,
            edge_color={0xaeb3b3,1},--{0xb20900,1},
            line_width_edge=2,
            fill=0,
            width=0,
        },
    },

}
config_weather={
    {
    x=0,    y=0,
    consult_weather={
        command="${execi 3600000 curl https://wttr.in/montevideo?format=j1 > ~/conky_hexagon/weather.json}",
    },
    hexagon_background={
            {
                x=709,y=400,
                diameter=300,
                edge_color={0xcad5cc,0.2},
                line_width_edge=1,
                fill=1,
                width=0,
                rotate=90,
            },
    },
    info={
        {
            data="temp_C",
            text="°C",
            color={0xf0b036,1},
            font_size=30,
            x=-40,y=-85,
        },
        {
            data="maxtempC",
            text=" °C  |",
            color={0xff0000,1},
            font_size=15,
            x=-75,y=-70,
        },
        {
            data="FeelsLikeC",
            text=" °C  |",
            color={0xffffff,1},
            font_size=15,
            x=-15,y=-70,
        },
        {
            data="mintempC",
            text=" °C",
            color={0x0080ff,1},
            font_size=15,
            x=45,y=-70,
        }, 
        {
            data="weatherDesc",
            text="",
            color={0xffffff,1},
            font_size=20,
            x=-100,y=-40,
        },
        {
            data="uvIndex",
            text="uv",
            color={0xf0b036,1},
            font_size=15,
            x=-50,y=-20,
        },
        {
            data="visibility",
            text="Km",
            color={0xf0b036,1},
            font_size=15,
            x=-10,y=-20,
        },
        {
            data="winddir16Point",
            text="",
            color={0xf0b036,1},
            font_size=20,
            x=65,y=-40,
        },
        {
            data="windspeedKmph",
            text="Kmph",
            color={0xf0b036,1},
            font_size=15,
            x=55,y=-20,
        },
        {
            data="sunHour",
            text="Hs",
            color={0xf0b036,1},
            font_size=15,
            x=-110,y=-20,
        },

    },
 
    },

}
function hex_to_rgba(tcolour)
    colour,alpha=tcolour[1],tcolour[2]
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
function show_text(cr,v,text)
    cairo_move_to (cr, v['x'],v['y'])
    local font_type="Courier New Regular"
    --cairo_select_font_face(cr, "Webdings",CAIRO_FONT_SLANT_NORMAL,CAIRO_FONT_WEIGHT_NORMAL);
    if text:sub(1,1)=='$' then
        text=conky_parse(text)
    end
    
    if v['font_type'] ~= nil then
        font_type =v['font_type']
    end
    cairo_select_font_face(cr, font_type ,CAIRO_FONT_SLANT_NORMAL,CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size (cr, v['font_size'])
    cairo_set_source_rgba(cr,hex_to_rgba(v['color']))
    cairo_show_text(cr,text)
    cairo_stroke (cr)
end
function percentage_hexagon_edge_motion(ctx,values)
    data=tonumber(conky_parse (values['percentage']['process']))

    if data <= 20 then
        k=1
    elseif data <= 50 then
        k=2
    elseif  data <=80 then
        k=3
    else
        k=4
    end

    values['hexagon_inside']['edge_color']=values['hexagon_inside']['degrade_edge_color'][k]['color']
    hexagon(ctx,values['hexagon_inside'])

    cairo_rotate(ctx,-angle_to_position(180,values['hexagon_rotate']))
    --VALUE
    cairo_move_to (ctx, values['percentage']['x'],values['percentage']['y'])
    cairo_set_font_size (ctx, values['percentage']['font_size'])
    if data <= 20 then
        cairo_set_source_rgba(ctx,hex_to_rgba(values['percentage']['color']))
    else
        cairo_set_source_rgba(ctx,hex_to_rgba(values['hexagon_inside']['degrade_edge_color'][k]['color']))
    end
    cairo_show_text(ctx,add_space_to_not_move(data.."").."%")
    cairo_stroke (ctx)
end
function top_hexagon_edge_motion(ctx,values)
    local i =1
    local x =values['top']['x']
    local y =values['top']['y']
    while i<=values['top']['number_of_process'] do
        cairo_move_to (ctx, x,y)
        cairo_set_font_size (ctx, values['top']['font_size'])
        cairo_set_source_rgba(ctx,hex_to_rgba(values['top']['color']))
        cairo_show_text(ctx,conky_parse ("${"..values['top']['name'].." "..i.."}"):gsub("%s+", ""))
        cairo_move_to (ctx,x+values['top']['distance_between_text'],y)
        cairo_show_text(ctx,conky_parse ("${"..values['top']['process'].." "..i.."}").."%")
        y=y-values['top']['distance_between_line']
        i=i+1
    end
end
function command_edge_motion(ctx,values)
    for i in pairs(values['command']) do

        local x =values['command'][i]['x']
        local y =values['command'][i]['y']

        cairo_move_to (ctx, x,y)
        cairo_set_source_rgba(ctx,hex_to_rgba(values['command'][i]['text_color']))
        cairo_set_font_size (ctx, values['command'][i]['font_size'])
        if values['command'][i]['title']~= nil then
                cairo_show_text(ctx,values['command'][i]['title'])
                cairo_move_to (ctx,x+values['command'][i]['distance_between_text'],y)
        end
        cairo_show_text(ctx,conky_parse (values['command'][i]['command']))
    end
end
function hexagon_edge_motion(ctx,values)
    k=1
    cairo_translate (ctx, values['x'],values['y'])

    --TITLE
    show_text(ctx,values['title'],values['title']['text'])

    --HEXAGON
    cairo_rotate(ctx,angle_to_position(180,values['hexagon_rotate']))
    --cairo_set_dash(ctx, {10, 10}, 1, 7) --linea de puntos habilitado
    hexagon(ctx,values['hexagon_edge'])--edge
    --cairo_set_dash(ctx, {}, 0, 0)--linea de puntos deshabilitado
    hexagon(ctx,values['hexagon_background'])--background

    --CHANGE COLOR HEXAGON INSIDE
    if values['percentage'] ~= nil then

        percentage_hexagon_edge_motion(ctx,values)
           
    else
        hexagon(ctx,values['hexagon_inside'])
        cairo_rotate(ctx,-angle_to_position(180,values['hexagon_rotate']))
    end

    --PROCESS
    if values['top'] ~= nil then
        top_hexagon_edge_motion(ctx,values)            
    end
    --COMMANDS
    if values['command'] ~= nil then
        command_edge_motion(ctx,values)        
    end
     cairo_stroke (ctx)
end
function add_space_to_not_move(s)
    j=0
    for i in s:gmatch("(.)") do
        j=j+1
    end
    if j == 1 then s="    "..s end
    if j == 2 then s="  "..s end
    return s
  end
--dibujo del hexagono
function hexagon(ctx,values)
    line_width=values['line_width_edge']
    width=values['width']
    fill=values['fill']
    color=values['edge_color']
    Diameter=values['diameter']
    i=1
    local point_hexagon = {
        {x=math.sqrt(3)*Diameter/4.,y=Diameter/4.},
        {x=0,y=Diameter/2.},
        {x=-math.sqrt(3)*Diameter/4.,y=Diameter/4.},--
        {x=-math.sqrt(3)*Diameter/4.,y=-Diameter/4.-width},
        {x=0,y=-Diameter/2.-width},
        {x=math.sqrt(3)*Diameter/4.,y=-Diameter/4.-width},--
        {x=math.sqrt(3)*Diameter/4.,y=Diameter/4.}
    }
    cairo_set_line_width(ctx, line_width)
    --cairo_set_dash(ctx, {10, 10}, 2, 7)
    cairo_translate (ctx, 0.01,0.01)
    while i+1 <= #point_hexagon do
        cairo_set_line_width(ctx,line_width)
        cairo_set_source_rgba(ctx,hex_to_rgba(color))--color
        if fill == 0 then cairo_move_to (ctx, point_hexagon[i].x,point_hexagon[i].y) end
        cairo_line_to(ctx,point_hexagon[i+1].x,point_hexagon[i+1].y)
        if fill == 0 then cairo_stroke (ctx) end
        i=i+1
    end
    if fill == 1 then
        cairo_fill (ctx)
        cairo_stroke (ctx)
    end
end
--calculo de la posicion para las manecillas del reloj
function angle_to_position(start_angle, current_angle)
    return ( ( current_angle * (2 * math.pi / start_angle) ) - (math.pi / 2) )
end
--calcular posicion del texto dentro del reloj
function calc_position_text_clock(data_value)
    local text
        if data_value['data']:sub(1,1)=='$' then
            text=(string.len(conky_parse(data_value['data']))/2)*10
           -- print(conky_parse(data_value['data']).." "..string.len(conky_parse(data_value['data'])).." text:"..text)
        else
            text=((string.len(data_value['data'])/2)*10)
           -- print((data_value['data']).." "..string.len((data_value['data'])).." text:"..text)
        end

        data_value['z']=-text
    return data_value['x']-text
end
--dibujo y posiciono las manecillas del reloj
function hand_clock(cr,time,values,number_hexagon,type_hand,type_translate)
    local i=1
    local translate=0
    cairo_rotate(cr,time)
    while i <=number_hexagon do
        cairo_translate (cr, values[type_hand]['diameter']+3.5,0)
        hexagon(cr,values[type_hand])
        translate= translate + (values[type_translate]['diameter']+3.5)
        i=i+1
    end
    cairo_translate (cr, -translate,0)
    cairo_rotate(cr,-time)
end
function hexagon_background(cr,values)
    local x=0
    local y=0
    for i in pairs(values) do 
        cairo_translate (cr, values[i]['x'],values[i]['y'])
        cairo_rotate(cr,angle_to_position(180,values[i]['rotate']))
        hexagon(cr,values[i]) 
        cairo_rotate(cr,angle_to_position(90,values[i]['rotate']))   
        x=x-values[i]['x']
        y=y-values[i]['y']
    end
    return {x,y}
end
-- reloj
function hexagon_clock(cr,values)
    local i=1
    local translate=0
    
    cairo_translate (cr, values['x'],values['y'])
    cairo_rotate(cr,angle_to_position(180,values['edge_clock']['rotate']))
    hexagon(cr,values['edge_clock']) --fondo del reloj
    cairo_rotate(cr,angle_to_position(90,values['edge_clock']['rotate']))
    hexagon(cr,values['clock_center'])
    
    --posicion y visualizacion del texto dentro del reloj
    for i in pairs(values['info']) do        
        if values['info'][i]['z'] == 0 then
            values['info'][i]['x'] = calc_position_text_clock(values['info'][i])
        end

        show_text(cr,values['info'][i],values['info'][i]['data'])
    end
    cairo_stroke (cr)

    --calculo de la posicion de las horas
    hours= angle_to_position(12,tonumber(conky_parse ("${time %H}"))-24)
    hand_clock(cr,hours,values,4,'hours','hours')
    

    --calculo de la posicion de los minutos
    minutes=angle_to_position(60,tonumber(conky_parse ("${time %M}")))
    hand_clock(cr,minutes,values,5,'minutes','hours')

    --calculo de la posicion de los segundos
    seconds=angle_to_position(60,(1+tonumber(conky_parse ("${time %S}"))))-- se suma 1 por el tiempo de acutalizacion de conky
    hand_clock(cr,seconds,values,6,'seconds','seconds')

    cairo_stroke (cr)

    hexagon_background(cr,values['background_clock'])
    
end


function hexagon_weather(cr,values)
   
    hexagon_background(cr,values['hexagon_background']) 
    
    for i in pairs(values['info']) do
        show_text(cr,values['info'][i],json_weather[values['info'][i]['data']]..values['info'][i]['text'])
    end
   
end

function conky_image_weather()
    local name_file="3200"
   
    if json_weather["weatherDesc"] ~= nil then

        name_file=json_weather["weatherDesc"]:gsub(" ","_")

        --valido si es AM o PM
        if tonumber(string.sub(conky_parse("${time %H:%M}"),1,2)) < 12 and tonumber(string.sub(conky_parse("${time %H:%M}"),1,2)) < (tonumber(string.sub(json_weather["sunset"],1,2))) then
            name_file=name_file.."_N"
        elseif tonumber(string.sub(conky_parse("${time %H:%M}"),1,2)) > 12 and tonumber(string.sub(conky_parse("${time %H:%M}"),1,2)) > (tonumber(string.sub(json_weather["sunrise"],1,2))+12) then
            name_file=name_file.."_N"
        end
        return "${image ~/conky_hexagon/imagenes/"..name_file..".png -p 630,410 -s 150x80}"
    end

    return "${image ~/conky_hexagon/imagenes/"..name_file..".png -p 680,420 -s 50x50}"
end

function conky_draw_clock()

    if conky_window==nil then return end
    local update_conky=tonumber(conky_parse('${updates}'))
    local cr=cairo_create(cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual,conky_window.width, conky_window.height))
    local cr1=cairo_create(cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual,conky_window.width, conky_window.height))
    local cr2=cairo_create(cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual,conky_window.width, conky_window.height))

    if update_conky > 5 then
        conky_parse(config_weather[1]['consult_weather']['command'])
    end
    
    json_weather= read_weather(conky_parse("${exec echo $HOME}")..'/conky_hexagon/weather.json')

    if update_conky > 1 then

        hexagon_clock(cr,config_clock[1])
        
        for i in pairs(config_edge_motion) do
            hexagon_edge_motion(cr1,config_edge_motion[i])
            
        end
 
        hexagon_weather(cr2,config_weather[1])


    end
end
