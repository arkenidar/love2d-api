-- file: main.lua
-- for Love2D

---@diagnostic disable: lowercase-global

local mouse = require "mouse"
local color = require "colors"
require "api"
require "rectangle_operations"

function init()
  set_title("app basics (Love2D app)")
end

local circle1 = { x = 100, y = 50, radius = 30 }

local rectangle1_xywh = { circle1.x + circle1.radius, circle1.y, 100, 100 }
local color_toggle_1, color_toggle_2 = "grey", "white"
local color1_name = color_toggle_1
local color1_hovered = false
local inside_previously = false

local rectangle2_xywh = { 200, 140, 50, 150 }

function update()
  local inside = point_inside_rectangle_xywh(mouse.point, rectangle1_xywh)

  if mouse.down and not inside then -- .down or .click
    circle1.x, circle1.y = mouse.x, mouse.y
    rectangle1_xywh = { circle1.x + circle1.radius, circle1.y, 100, 100 }
  end

  inside = point_inside_rectangle_xywh(mouse.point, rectangle1_xywh)
  local entered = inside and not inside_previously
  local exited = not inside and inside_previously
  inside_previously = inside

  if entered and not mouse.down then color1_hovered = true end
  if exited then color1_hovered = false end

  if inside and mouse.click then
    if color1_hovered then
      color1_hovered = false
    else
      color1_name = color1_name == color_toggle_1 and color_toggle_2 or color_toggle_1
    end
  end

  local is_intersecting_r1_r2 = rectangle_xywh_intersect_boolean(rectangle1_xywh, rectangle2_xywh)
  color2 = is_intersecting_r1_r2 and color.blue or color.brown
end

require "outset" -- "rectangle_outset" code from: https://github.com/arkenidar/circles-lua

function draw()
  set_color(color.red)
  circle(circle1)

  set_color(color[color1_hovered and "yellow" or color1_name])
  rectangle(rectangle1_xywh)

  set_color(color2)
  rectangle_outset(rectangle2_xywh)
end
