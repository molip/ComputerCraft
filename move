x, y, z = 0, 0, 0
dir = 0

function _getDx()
  if dir == 1 then return 1 elseif dir == 3 then return -1 else return 0 end
end

function _getDz()
  if dir == 0 then return 1 elseif dir == 2 then return -1 else return 0 end
end

function _do(n, func, dx, dy, dz)
  done = 0
  for i = 1, n do
    if func() == false then break end
	done = done + 1
	x = x + dx
	y = y + dy
	z = z + dz
  end
  return done
end

function forward(n)
  return _do(n, turtle.forward, _getDx(), 0, _getDz())
end

function back(n)
  return _do(n, turtle.back, -_getDx(), 0, -_getDz())
end

function up(n)
  return _do(n, turtle.up, 0, 1, 0)
end

function down(n)
  return _do(n, turtle.down, 0, -1, 0)
end

function turnLeft(n)
  n = n or 1
  turtle.turnLeft()
  dir = (dir - n) % 4
end

function turnRight(n)
  n = n or 1
  turtle.turnLeft()
  dir = (dir + n) % 4
end

function getPos()
  return x, y, z
end

