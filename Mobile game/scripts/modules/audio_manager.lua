local self = {}

local now_playing = nil

function self.play_music(event_name, fade_time)
    if not fade_time then fade_time = 0.5 end

    local event_description = fmod.studio.system:get_event(event_name)
    local event = event_description:create_instance()

    if now_playing == event then
        return
    elseif now_playing then
        self.fade_music(now_playing, 1.0, 0.0, fade_time) -- Fade out over 2 seconds

        timer.delay(fade_time, false, function()
        now_playing = event
        now_playing:start()
        self.fade_music(now_playing, 0.0, 1.0, fade_time) -- Fade in over 2 seconds
    end)
    else -- No music playing
        event:start()
        now_playing = event
    end
end

function self.fade_music(event_instance, start_volume, end_volume, duration)
    local step = (end_volume - start_volume) / (duration * 60) -- Assuming 60 updates per second
    local current_volume = start_volume
    for i = 1, duration * 60 do
        timer.delay(i / 60, false, function()
            current_volume = math.min(math.max(current_volume + step, 0), 1)
            event_instance:set_volume(current_volume)
        end)
    end
end

function self.play_sound_effect(event_name)
    local event_description = fmod.studio.system:get_event(event_name)
    local event = event_description:create_instance()
    event:start()
end

return self