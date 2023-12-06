local self = {}

NOW_PLAYING = nil
BPM = 120
CROCHET = 60 / BPM
OFFSET = 0.0
SONG_POSITION = 0.0 + OFFSET
local next_beat_time = 0

function self.play_music(event_name, fade_time)
    if not fade_time then fade_time = 0.5 end

    local event_description = fmod.studio.system:get_event(event_name)
    local event = event_description:create_instance()

    if NOW_PLAYING == event then
        return
    elseif NOW_PLAYING then
        self.fade_music(NOW_PLAYING, 1.0, 0.0, fade_time) -- Fade out over 2 seconds

        timer.delay(fade_time, false, function()
        NOW_PLAYING = event
        NOW_PLAYING:start()
        BPM = event:get_parameter_by_name("BPM")
        self.fade_music(NOW_PLAYING, 0.0, 1.0, fade_time) -- Fade in over 2 seconds
    end)
    else -- No music playing
        event:start()
        NOW_PLAYING = event
        BPM = event:get_parameter_by_name("BPM")
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

function self.update(dt)
    if NOW_PLAYING then
        local position = NOW_PLAYING:get_timeline_position()
        SONG_POSITION = position / 1000 + OFFSET  -- Convert from milliseconds to seconds

        -- Calculate the time for the next beat
        CROCHET = 60 / BPM

        -- Check if the current song position has reached the next beat time
        if SONG_POSITION >= next_beat_time then
            -- Trigger beat action
            self.on_beat()

            -- Calculate the time for the next beat
            next_beat_time = next_beat_time + CROCHET
        end
    end
end

function self.on_beat()
    -- Logic to execute on each beat
    print("SONG_POSITION: " .. SONG_POSITION .. " On Beat!")
    return true
end

return self