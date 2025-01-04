local gamestates = {
    title = 0,
    game = 3,
    gameover = 5
}
local g_state = gamestates.game
frame_x = { 8, 32, 56, 80, 104, 80, 56, 32, 8 }
--dx = { -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4 }
--y_speeds = { 0.2, 0.3, 0.4, 0.5, 1, 0.5, 0.4, 0.3, 0.2 }
y_speeds = { 0.2, 0.3, 0.4, 0.5, 1, 0.5, 0.4, 0.3, 0.2 }
dx = { -1.7, -1.2, -1, -0.9, 0, 0.9, 1, 1.2, 1.7 }
score = 0
needle_x = 35
needle_speed = 0.1
good_color = 0

-- green 32-52
-- red 53-73
--blue  74-94

ranges = {
    green = { 32, 52 },
    red = { 53, 73 },
    blue = { 74, 94 }
}

ring_t = 60

player = {
    x = 48,
    y = 12,
    facing_right = false,
    frame = 1,
    fake_frame = 0,
    update = function(self)
        self.facing_right = self.frame > 5
        --self.y += y_speeds[p1.frame]
        player.x = mid(0, player.x + (dx[player.frame]), 100)
    end,
    draw = function()
        pal(14, 5)
        sspr(frame_x[player.frame], 0, 24, 24, player.x, player.y, 24, 24, player.facing_right)
        pal()
    end,
}

hud = {
    draw = function(self)
        --rectfill(20, 1, 27, 7, 3)
        rectfill(0, 0, 128, 10, 0)
        rectfill(32, 1, 32 + 20, 1 + 5, 3)
        rectfill(53, 1, 53 + 20, 1 + 5, 8)
        rectfill(74, 1, 74 + 20, 1 + 5, 12)
        line(needle_x, 0, needle_x, 7, 7)
        print(needle_x, 8, 2, 7)
    end,
}


function _init()

end

function _update()
    check_inputs()
    player:update()
    if player.frame >= 6 then
        player.facing_right = true
    end

    needle_x += needle_speed
    if needle_x >= 94 or needle_x <= 32 then
        needle_speed *= -1
    end

    update_rings()
    ring_t -= 1
    if ring_t <= 0 then
        spawn_rings()
        ring_t = 60
    end
end

function get_current_color()
    if in_range(needle_x, ranges.green[1], ranges.green[2]) then
        return 3
    elseif in_range(needle_x, ranges.red[1], ranges.red[2]) then
        return 8
    else
        return 12
    end
end

function _draw()
    cls(0)
    --map()

    draw_rings_back()

    player:draw()



    draw_rings_front()

    
    hud:draw()
end

function check_inputs()
    if btnp(🅾️) then
        if g_state == gamestates.title then
            g_state = gamestates.game
        elseif g_state == gamestates.game then
            spawn_walls()
        elseif g_state == gamestates.gameover then

        end
    end
    if btnp(❎) then
        if g_state == gamestates.title then

        elseif g_state == gamestates.game then

        elseif g_state == gamestates.gameover then

        end
    end


    if btnp(➡️) then
        if g_state == gamestates.title then


        elseif g_state == gamestates.game then
            --needle_x += 1
            --p1:update_img("r")
            player.frame = mid(1, player.frame + 1, 9)
            --p1.x += 1.5
            --p1.frame+=1
            --p1.f=false
        elseif g_state == gamestates.gameover then

        end
    elseif btnp(⬅️) then
        if g_state == gamestates.title then

        elseif g_state == gamestates.game then
            player.frame = mid(1, player.frame - 1, 9)
        elseif g_state == gamestates.gameover then

        end
    end
end

function shuffle_table(t)
    -- do a fisher-yates shuffle
    for i = #t, 1, -1 do
        local j = flr(rnd(i)) + 1
        t[i], t[j] = t[j], t[i]
    end
end

function in_range(val, min, high)
    if val >= min and val <= high then
        return true
    end
end
