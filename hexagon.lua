require 'cairo'

config = {
    {
        x=-165,    y=175,
        hexagon_rotate=90,
        title={
            text="cpu",
            color={0xFFFFFF,.2},
            font_size=65,
            x=-27,y=25,
        },
        percentage ={
            process="${cpu}",
            color={0xFFFFFF,1},
            font_size=20,
            x=70,y=-15,
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
            edge_color={0x0038ff,0.15},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter_init=50,
            diameter=95,
            edge_color={{0x07b60a,1}},
            line_width_edge=3,
            fill=0,
            width=100,
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
            distance_between_text=100,
            x=-20, y=30,
        },
    },
    {
        x=190,    y=52,
        hexagon_rotate=90,
        title={
            text="mem",
            color={0xFFFFFF,.2},
            font_size=65,
            x=-27,y=25,
        },
        percentage ={
            process="${memperc}",
            color={0xFFFFFF,1},
            font_size=20,
            x=70,y=-15,
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
            edge_color={0x0038ff,0.15},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter_init=50,
            diameter=95,
            edge_color={{0x07b60a,1}},
            line_width_edge=3,
            fill=0,
            width=100,
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
        x=-190,    y=52,
        hexagon_rotate=90,
        title={
            text="Disk",
            color={0xFFFFFF,0.2},
            font_size=65,
            x=-27,y=25,
        },

        hexagon_edge={
            diameter=110,
            edge_color={0xffffff,1},
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
            diameter_init=50,
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
        x=190,    y=52,
        hexagon_rotate=90,
        title={
            text="up",
            color={0xFFFFFF,0.2},
            font_size=65,
            x=10,y=25,
        },
        hexagon_edge={
            diameter=110,
            edge_color={0xffffff,1},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=100,
            edge_color={0xffffff,0.2},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter_init=50,
            diameter=95,
            edge_color={0xffffff,0.5},
            line_width_edge=3,
            fill=0,
            width=100,
        },
        command={
            {
                x=-19,y=10,
                text_color={0x2ef900,0.7},
                font_size=25,
                command="${uptime}",
            },
        },
    },
    {
        x=-190,    y=52,
        hexagon_rotate=90,
        title={
            text="temp",
            color={0xFFFFFF,0.05},
            font_size=65,
            x=-27,y=25,
        },
        hexagon_edge={
            diameter=110,
            edge_color={0xffffff,1},
            line_width_edge=1,
            fill=0,
            width=100,
        },
        hexagon_background={
            diameter=100,
            edge_color={0x666699,0.3},
            line_width_edge=1,
            fill=1,
            width=100,
        },
        hexagon_inside={
            diameter_init=50,
            diameter=95,
            edge_color={0xffffff,0.7},
            line_width_edge=3,
            fill=0,
            width=100,
        },
    },

}
config_clock={
    {
        x=220,    y=140,
        edge_clock={
            diameter=273,
            edge_color={0xaeb3b3,0.25},
            line_width_edge=1,
            fill=1,
            width=0,
            rotate=90,
        },
        info={
            {
                data="${time %d} ${time  %B} ${time %Y}",
                color={0xFFFFFF,.7},
                font_size=18,
                x=5,y=-50,
            },
            {
                data="${time %A}",
                color={0xf0b036,1},
                font_size=27,
                x=-10,y=-80,
            },
            {
                data="${kernel}",
                color={0xffffff,0.7},
                font_size=20,
                x=0,y=-19,
            },
            {
                data="${exec lsb_release -d | cut -d ':' -f 2 | tr  -d '[:blank:]'}",
                color={0xffffff,0.9},
                font_size=18,
                x=0,y=60,
            },
            {
                data="${addr enp3s0}",
                color={0xdfa418,0.8},
                font_size=18,
                x=0,y=90,
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
function hex_to_rgba(tcolour)
    colour,alpha=tcolour[1],tcolour[2]
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
function hexagon_edge_motion(ctx,values)
    k=1
    cairo_translate (ctx, values['x'],values['y'])

    --TITLE
    cairo_move_to (ctx, values['title']['x'],values['title']['y'])
    cairo_set_font_size (ctx, values['title']['font_size'])
    cairo_set_source_rgba(ctx,hex_to_rgba(values['title']['color']))
    cairo_show_text(ctx,values['title']['text']:upper())
    cairo_stroke (ctx)

    --HEXAGON
    cairo_rotate(ctx,angle_to_position(180,values['hexagon_rotate']))
    --cairo_set_dash(ctx, {10, 10}, 1, 7) --linea de puntos habilitado
    hexagon(ctx,values['hexagon_edge'])--edge
    --cairo_set_dash(ctx, {}, 0, 0)--linea de puntos deshabilitado
    hexagon(ctx,values['hexagon_background'])--background

    --CHANGE COLOR HEXAGON INSIDE
    if values['percentage'] ~= nil then

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
    else
        hexagon(ctx,values['hexagon_inside'])
        cairo_rotate(ctx,-angle_to_position(180,values['hexagon_rotate']))
    end

    --PROCESS
    if values['top'] ~= nil then

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
    --COMMANDS
    if values['command'] ~= nil then

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
function calc_position(data_value)
   
        if data_value['data']:sub(1,1)=='$' then
            return data_value['x']-((string.len(conky_parse(data_value['data']))/2)*10)
        else
            return data_value['x']-((string.len(data_value['data'])/2)*10)
        end
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
        cairo_move_to (cr, calc_position(values['info'][i]),values['info'][i]['y'])
        cairo_set_font_size (cr, values['info'][i]['font_size'])
        cairo_set_source_rgba(cr,hex_to_rgba(values['info'][i]['color']))
        if values['info'][i]['data']:sub(1,1)=='$' then
            cairo_show_text(cr,conky_parse(values['info'][i]['data']))
        else
            cairo_show_text(cr,values['info'][i]['data'])
        end
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
end


function conky_draw_clock()
    if conky_window==nil then return end

    local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual,conky_window.width, conky_window.height)
    local update_conky=tonumber(conky_parse('${updates}'))
    local cr=cairo_create(cs)
    if update_conky > 1 then
	    --      cairo_paint_with_alpha(cr,0.1) --background is faded out using the alpha value

        for i in pairs(config_clock) do
            hexagon_clock(cr,config_clock[i])
        end

        for i in pairs(config) do
            hexagon_edge_motion(cr,config[i])
        end


    end
end
