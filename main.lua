WIDTH = 1200
HEIGHT = 800

pixels = {{0, 0}}

stepsPerFrame = 500

function love.load()
  success = love.window.setMode(WIDTH, HEIGHT, {borderless = false})
end

function love.update(dt)
    for i = 0, stepsPerFrame do
      rand = love.math.random(0, 10000000)
      if(rand < 100000) then
        newX =  0
        newY =  0.16*pixels[#pixels][2]
      elseif(rand < 8600000) then
        newX =  0.85*pixels[#pixels][1] + 0.04*pixels[#pixels][2]
        newY = -0.04*pixels[#pixels][1] + 0.85*pixels[#pixels][2] + 1.6
      elseif(rand < 9300000)then
        newX =  0.20*pixels[#pixels][1] - 0.26*pixels[#pixels][2]
        newY =  0.23*pixels[#pixels][1] + 0.22*pixels[#pixels][2] + 1.6
      else
        newX = -0.15*pixels[#pixels][1] + 0.28*pixels[#pixels][2]
        newY =  0.26*pixels[#pixels][1] + 0.24*pixels[#pixels][2] + 0.44
      end
      table.insert(pixels, {newX, newY})
    end
    
end

function love.draw()
    for i = 1, #pixels do
      b = map(pixels[i][1], -2.1820, 2.6558, 0, 1)
      r = map(pixels[i][2], 0, 9.9983, 0, 1)
      g = map(pixels[i][2] * pixels[i][1], -21.8162906, 26.55348514, 0, 1)
      love.graphics.setColor(r, g, b)
      
      love.graphics.circle("fill", 
        map(pixels[i][1], -2.1820, 2.6558, 0, WIDTH),
        map(pixels[i][2], 0, 9.9983, HEIGHT, 0),
        0.5)
    end
end

function love.keypressed(key)
    if key == "escape" then
      love.event.quit()
    end
end

function map(value, istart, istop, ostart, ostop)
    return ostart + (ostop - ostart) * ((value - istart) / (istop - istart))
end
