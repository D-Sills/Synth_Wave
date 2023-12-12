local self = {}

NOW_PLAYING = nil
BPM = 120
CROTCHET = 60 / BPM -- 1 beat
OFFSET = 0.0
SONG_POSITION = 0.0 + OFFSET
SONG_LENGTH = 0.0 + OFFSET

PERFECT_THRESHOLD = 0.1  -- 100 milliseconds around the beat
GOOD_THRESHOLD = 0.2     -- 200 milliseconds around the beat

local next_beat_time = 0
local last_beat_time = 0
local last_position = 0

local beat_subscribers = {}

function self.play_music(event_name, fade_time)
    if not fade_time then fade_time = 0.5 end
    
    local event_description = fmod.studio.system:get_event("event:/" .. event_name)
    SONG_LENGTH = event_description:get_length()
    local event = event_description:create_instance()

    if NOW_PLAYING == event then
        return
    elseif NOW_PLAYING then
        self.fade_music(NOW_PLAYING, 1.0, 0.0, fade_time) -- Fade out over 2 seconds

        timer.delay(fade_time, false, function()
        NOW_PLAYING = event
        NOW_PLAYING:start()
        self.fade_music(NOW_PLAYING, 0.0, 1.0, fade_time) -- Fade in over 2 seconds
    end)
    else -- No music playing
        event:start()
        NOW_PLAYING = event
    end

    print("BPM: " .. BPM)
    print("SONG_LENGTH: " .. SONG_LENGTH)
end

function self.stop_music(fade_time)
    if not fade_time then fade_time = 0.5 end

    if NOW_PLAYING then
        self.fade_music(NOW_PLAYING, 1.0, 0.0, fade_time) -- Fade out over 2 seconds

        timer.delay(fade_time, false, function()
            NOW_PLAYING:stop(fmod.STUDIO_STOP_MODE_ALLOWFADEOUT)
            NOW_PLAYING = nil
        end)
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
    local event_description = fmod.studio.system:get_event("event:/" .. event_name)
    local event = event_description:create_instance()
    event:start()
end

function self.update(dt)
    if NOW_PLAYING then
        local position = NOW_PLAYING:get_timeline_position()

        -- Check if the song has looped
        if position < last_position then
            -- Song has looped; reset beat times
            next_beat_time = CROTCHET
            last_beat_time = 0
        end
        last_position = position

        SONG_POSITION = position / 1000 + OFFSET  -- Convert from milliseconds to seconds

        -- Calculate the time for the next beat
        CROTCHET = 60 / BPM

        -- Check if the current song position has reached the next beat time
        if SONG_POSITION >= next_beat_time then
            -- Trigger beat action
            self.on_beat()

            -- Calculate the time for the next beat
            last_beat_time = next_beat_time
            next_beat_time = next_beat_time + CROTCHET
        end
    end
end


function self.on_beat()
    -- print("SONG_POSITION: " .. SONG_POSITION .. " On Beat!")
    for url, _ in pairs(beat_subscribers) do
        if url then  -- Check if the URL points to a valid object
            msg.post(url, "beat")
        else
            self.unsubscribe(url)  -- Automatically unsubscribe invalid URLs
        end
    end
end

-- Player action timing functions
function self.handle_player_action()
    local player_action_time = SONG_POSITION
    local time_diff = self.check_beat_accuracy(player_action_time)
    local rating = self.rate_player_action(time_diff)

    -- Do something with the rating, like updating score or UI
    print("Action Rating: " .. rating)
    return rating
end

function self.check_beat_accuracy(player_action_time)
    local time_to_prev_beat = player_action_time - last_beat_time
    local time_to_next_beat = next_beat_time - player_action_time

    local time_diff = math.min(math.abs(time_to_prev_beat), math.abs(time_to_next_beat))
    return time_diff
end

function self.rate_player_action(time_diff)
    if time_diff <= PERFECT_THRESHOLD then
        return "Perfect"
    elseif time_diff <= GOOD_THRESHOLD then
        return "Good"
    else
        return "Bad"
    end
end

function self.subscribe(url)
    beat_subscribers[url] = true
end

function self.unsubscribe(url)
    beat_subscribers[url] = nil
end

function self.unsubscribe_all()
    beat_subscribers = {}
end

return self