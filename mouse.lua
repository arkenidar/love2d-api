local mouse = {}

function mouse.update()
  mouse.x, mouse.y = love.mouse.getPosition()
  mouse.point = { mouse.x, mouse.y }
  mouse.down_previously = mouse.down
  mouse.down = love.mouse.isDown(1)
  mouse.click = mouse.down and not mouse.down_previously
end

return mouse
