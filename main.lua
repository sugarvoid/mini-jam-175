local gamestates = {
    title = 0,
    game = 3,
    gameover = 5
}
local g_state = gamestates.game
frame_x = { 8, 32, 56, 80, 104, 80, 56, 32, 8 }
--dx = { -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4 }
--y_speeds = { 0.2, 0.3, 0.4, 0.5, 1, 0.5, 0.4, 0.3, 0.2 }
y_speeds = { 0.2, 0.3, 0.4, 0.5, 1.5, 0.5, 0.4, 0.3, 0.2 }
dx = { -2.5, -2, -1.5, -1, 0, 1, 1.5, 2, 2.5 }
score = 0
needle_x = 35
needle_speed = 0.4
good_color = 0
dis_left = 900

-- green 32-52
-- red 53-73
--blue  74-94

ranges = {
    green = { 32, 52 },
    red = { 53, 73 },
    yellow = { 74, 94 }
}

ring_t = 60
needle_t = (rnd({8,10,15}) * 30)

player = {
    x = 48,
    y = 12,
    facing_right = false,
    frame = 1,
    fake_frame = 0,
    hitbox={x=0,y=0,w=2,h=2},
    update = function(self)
        self.facing_right = self.frame > 5
        --self.y += y_speeds[p1.frame]
        player.x = mid(0, player.x + (dx[player.frame]), 100)
        self.hitbox.x = self.x+24/2
        self.hitbox.y = self.y+24/2
    end,
    draw = function(self)
        pal(14, 0)
        sspr(frame_x[player.frame], 0, 24, 24, player.x, player.y, 24, 24, player.facing_right)
        pal()
        pset(self.hitbox.x , self.hitbox.y, 8)
    end,
}

hud = {
    draw = function(self)
        --rectfill(20, 1, 27, 7, 3)
        rectfill(0, 0, 128, 10, 0)
        rectfill(32, 1, 32 + 20, 1 + 5, 11)
        rectfill(53, 1, 53 + 20, 1 + 5, 8)
        rectfill(74, 1, 74 + 20, 1 + 5, 10)
        line(needle_x, 0, needle_x, 7, 7)
        print(score, 8, 2, get_current_color())
        print(flr(dis_left).."ft", 100, 2, get_current_color())
    end,
}


function _init()

end


function reverse_needle_dir()
    sfx(0)
    needle_speed *= -1
end

function _update()
    check_inputs()
    player:update()
    if player.frame >= 6 then
        player.facing_right = true
    end

    

    needle_x += needle_speed
    if needle_x >= 94 or needle_x <= 32 then
        reverse_needle_dir()
    end
    -- FIXME: something is not right
    dis_left-= ((abs(y_speeds[player.frame])) / 10)
    update_flags()
    update_rings()
    ring_t -= 1
    if ring_t <= 0 then
        spawn_rings()
        ring_t = 60
    end
    --needle_t-=1
    --if needle_t <= 0 then
    --    reverse_needle_dir()
    --    needle_t = (rnd({8,10,15}) * 30)
    --end
    for r in all(rings) do
        if is_colliding(player.hitbox, r.hitbox) then
            if get_current_color() == r.color then
        --if is_pixel_on_line(player.hitbox.x, player.hitbox.y, f.line.x1, f.line.y1, f.line.x2, f.line.y2) then
                sfx(1)
                score+=10
                
                else
                    sfx(2)
            end
            --print_debug(r.color)
            del(rings, r)
        end
    end
end

function get_current_color()
    if in_range(needle_x, ranges.green[1], ranges.green[2]) then
        return 11
    elseif in_range(needle_x, ranges.red[1], ranges.red[2]) then
        return 8
    elseif in_range(needle_x, ranges.yellow[1], ranges.yellow[2]) then
        return 10
    else
        return 0
    end
end

function _draw()
    cls(12)
    player:draw()
    draw_flags()
    draw_rings()
    hud:draw()
end

function check_inputs()
    if btnp(🅾️) then
        if g_state == gamestates.title then
            g_state = gamestates.game
        elseif g_state == gamestates.game then
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
    if ceil(val) >= min and flr(val) <= high then
        return true
    end
end


function print_debug(str)
    printh("debug: " .. str, 'debug.txt')
end



function is_colliding(a, b)
    return (a.x < b.x + b.w and 
    a.x + a.w > b.x and 
    a.y < b.y + b.h and 
    b.y < a.y + a.h)
end