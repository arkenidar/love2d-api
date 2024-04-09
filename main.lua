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

function update()
  if mouse.click then -- .down or .click
    circle1.x, circle1.y = mouse.x, mouse.y
  end
end

require "outset" -- "rectangle_outset" code from: https://github.com/arkenidar/circles-lua

function draw()
  set_color(color.red)
  circle(circle1)

  local rectangle1_xywh = { circle1.x + circle1.radius, circle1.y, 100, 100 }
  local rectangle2_xywh = { 200, 100, 50, 150 }

  local is_mouse_inside1 = point_inside_rectangle_xywh(mouse.point, rectangle1_xywh)
  local color1 = is_mouse_inside1 and color.yellow or color.green

  set_color(color1)
  rectangle_outset(rectangle1_xywh)

  local is_intersecting_r1_r2 = rectangle_xywh_intersect_boolean(rectangle1_xywh, rectangle2_xywh)
  local color2 = is_intersecting_r1_r2 and color.blue or color.brown

  set_color(color2)
  rectangle_outset(rectangle2_xywh)
end
