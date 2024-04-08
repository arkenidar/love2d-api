---@diagnostic disable: lowercase-global

local spread = require "spread"

function set_color(color_to_set)
  love.graphics.setColor(spread(color_to_set))
end

function circle(circle_xyr)
  love.graphics.circle("fill", circle_xyr.x, circle_xyr.y, circle_xyr.radius)
end

function rectangle(rectangle_xywh)
  love.graphics.rectangle("fill", spread(rectangle_xywh))
end

function love.load()
  init()
end

set_title = love.window.setTitle

local mouse = require "mouse"

function love.update()
  mouse.update()
  update()
end

function love.draw()
  draw()
end
