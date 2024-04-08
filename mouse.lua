local mouse = {}

function mouse.update()
  mouse.x, mouse.y = love.mouse.getPosition()
  mouse.point = { mouse.x, mouse.y }
  mouse.down = love.mouse.isDown(1)
end

return mouse
