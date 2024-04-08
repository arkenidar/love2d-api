---@diagnostic disable: lowercase-global

function rectangle_outset(rectangle_xywh)
    -- "rectangle_outset" code from: https://github.com/arkenidar/circles-lua

    rectangle(rectangle_xywh)

    local thickness = 3

    set_color({ 74 / 255, 73 / 255, 72 / 255 })
    rectangle({ rectangle_xywh[1], rectangle_xywh[2] + rectangle_xywh[4] - thickness, rectangle_xywh[3], thickness })
    rectangle({ rectangle_xywh[1] + rectangle_xywh[3] - thickness, rectangle_xywh[2], thickness, rectangle_xywh[4] })

    set_color({ 230 / 255, 229 / 255, 228 / 255 })
    rectangle({ rectangle_xywh[1], rectangle_xywh[2], rectangle_xywh[3], thickness })
    rectangle({ rectangle_xywh[1], rectangle_xywh[2], thickness, rectangle_xywh[4] })

    rectangle_xywh = { rectangle_xywh[1] + thickness, rectangle_xywh[2] + thickness, rectangle_xywh[3] - thickness * 2,
        rectangle_xywh[4] -
        thickness * 2 }

    set_color({ 136 / 255, 134 / 255, 133 / 255 })
    rectangle({ rectangle_xywh[1], rectangle_xywh[2] + rectangle_xywh[4] - thickness, rectangle_xywh[3], thickness })
    rectangle({ rectangle_xywh[1] + rectangle_xywh[3] - thickness, rectangle_xywh[2], thickness, rectangle_xywh[4] })

    set_color({ 255 / 255, 255 / 255, 255 / 255 })
    rectangle({ rectangle_xywh[1], rectangle_xywh[2], rectangle_xywh[3], thickness })
    rectangle({ rectangle_xywh[1], rectangle_xywh[2], thickness, rectangle_xywh[4] })
end
