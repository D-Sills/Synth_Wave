local self = {}

SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 720

function self.lerp(a, b, t)
	return a + (b - a) * t
end

function self.random_position()
    local x, y

    if math.random() > 0.5 then
        x = math.random() > 0.5 and -50 or SCREEN_WIDTH + 50  -- Left or right off-screen
        y = math.random(0, SCREEN_HEIGHT)
    else
        x = math.random(0, SCREEN_WIDTH)
        y = math.random() > 0.5 and -50 or SCREEN_HEIGHT + 50  -- Top or bottom off-screen
    end

    return vmath.vector3(x, y, 0)
end

function self.get_screen_size()
	return {width = SCREEN_WIDTH, height = SCREEN_HEIGHT}
end

return self