local self = {}

SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 720

DIFFCULTY = {
    EASY = 0.4,
    MEDIUM = 0.75,
    HARD = 1
}

CHOSEN_DIFFICULTY = DIFFCULTY.MEDIUM

function self.lerp(a, b, t) -- defold lerp is vector3 only
	return a + (b - a) * t
end

function self.clamp(val, lower, upper)
    assert(val and lower and upper, "not very valid input")
    if lower > upper then lower, upper = upper, lower end
    return math.max(lower, math.min(upper, val))
end

function self.random_position()
    local x, y

    if math.random() > 0.5 then
        x = math.random() > 0.5 and -50 or SCREEN_WIDTH + 50  -- left or right off-screen
        y = math.random(0, SCREEN_HEIGHT)
    else
        x = math.random(0, SCREEN_WIDTH)
        y = math.random() > 0.5 and -50 or SCREEN_HEIGHT + 50  -- top or bottom off-screen
    end

    return vmath.vector3(x, y, 0)
end

function self.get_screen_size()
	return {width = SCREEN_WIDTH, height = SCREEN_HEIGHT}
end

function self.set_difficulty(difficulty)
    CHOSEN_DIFFICULTY = difficulty
end

function self.get_difficulty()
    return CHOSEN_DIFFICULTY
end

return self