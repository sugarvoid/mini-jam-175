local gamestates = {
    title = 0,
    game = 3,
    gameover = 5
}
local title = "plane's descent"
local sub_title = "mini jam 175"
local g_state = gamestates.title
poke(0x5f5c, 255)

frame_x = { 8, 32, 56, 80, 104, 80, 56, 32, 8 }
y_speeds = { 0.2, 0.3, 0.4, 0.5, 1.5, 0.5, 0.4, 0.3, 0.2 }
dx = { -2.5, -2, -1.5, -1, 0, 1, 1.5, 2, 2.5 }
score = 0
--local needle_x = 35
--local needle_speed = 0.4
local dis_left = 100
local flags_passed = 0

local ranges = {
    green = { 32, 52 },
    red = { 53, 73 },
    yellow = { 74, 94 }
}

ring_t = 60

needle = {
    x=35,
    y=0,
    speed=0.4,
    update=function(self)
        self.x += self.speed
        if self.x >= 94 or self.x <= 32 then
            self:reverse_dir()
        end
    end,
    reverse_dir=function(self)
        self.speed *= -1
    end,
    draw=function(self)
        line(self.x, 121-1, self.x, 121+7, 7)
    end
}

player = {
    x = 48,
    y = 10,
    facing_right = false,
    frame = 1,
    hitbox = { x = 0, y = 0, w = 2, h = 2 },
    update = function(self)
        self.facing_right = self.frame > 5
        --self.y += y_speeds[p1.frame]
        self.x = mid(0, self.x + (dx[self.frame]), 100)
        self.hitbox.x = self.x + 24 / 2
        self.hitbox.y = self.y + 24 / 2

        if self.y >= 130 then
            g_state = gamestates.gameover
        end
    end,
    draw = function(self)
        pal(14, 0)
        sspr(frame_x[self.frame], 0, 24, 24, self.x, self.y, 24, 24, self.facing_right)
        pal()
    end,
    reset = function(self)
        self.x = 48
        self.y = 10
        self.facing_right = false
        self.frame = 1
    end
}

hud = {
    bar_y1 = 128-7,
    draw = function(self)
        --rectfill(0, 0, 128, 10, 0)
        --rectfill(32, 1, 32 + 20, 1 + 5, 11)
        --rectfill(53, 1, 53 + 20, 1 + 5, 8)
        --rectfill(74, 1, 74 + 20, 1 + 5, 10)
        --line(needle_x, self.bar_y1-2, needle_x, self.bar_y1+7, 7)
        --print(score, 8, 2, get_current_color())
        --print(flr(dis_left) .. "ft", 100, self.bar_y1, get_current_color())


        rectfill(0, self.bar_y1-2, 128, 128, 0)
        rectfill(32, self.bar_y1, 32 + 20, self.bar_y1 + 5, 11)
        rectfill(53, self.bar_y1, 53 + 20, self.bar_y1 + 5, 8)
        rectfill(74, self.bar_y1, 74 + 20, self.bar_y1 + 5, 10)
        needle:draw()
        --print(score, 8, 2, get_current_color())
        print(flr(dis_left) .. "ft", 100, self.bar_y1, get_current_color())



    end,
}


function _init()
    reset_game()
end



function _update()
    check_inputs()
    if g_state == gamestates.title then

    elseif g_state == gamestates.game then
        update_game()
    elseif g_state == gamestates.gameover then

    end
end

function _draw()
    if g_state == gamestates.title then
        draw_title()
    elseif g_state == gamestates.game then
        draw_game()
    elseif g_state == gamestates.gameover then
        draw_gameover()
    end
end

function get_current_color()
    if in_range(needle.x, ranges.green[1], ranges.green[2]) then
        return 11
    elseif in_range(needle.x, ranges.red[1], ranges.red[2]) then
        return 8
    elseif in_range(needle.x, ranges.yellow[1], ranges.yellow[2]) then
        return 10
    else
        return 0
    end
end

function draw_title()
    cls(0)
    print(title, hcenter(title), 35, 7)
    print(sub_title, hcenter(sub_title), 45, 7)
    print("press 🅾️ to play", hcenter("press 🅾️ to play"), 82, 7)
end

function draw_gameover()
    cls(0)
    print("game over", hcenter("game over"), 35, 7)
    print("score: " .. score .. "/"..flags_passed, hcenter("score: " .. score .. "/10"), 60, 7)
    if score == flags_passed then
        print("perfect!", hcenter("perfect"), 68, 7)
    end
end

function draw_game()
    cls(12)
    player:draw()
    draw_flags()
    draw_rings()
    water:draw()
    hud:draw()
end

function update_game()
    player:update()
    if player.frame >= 6 then
        player.facing_right = true
    end

    needle:update()
    -- FIXME: something is not right
    dis_left -= ((abs(y_speeds[player.frame])) / 10)
    dis_left = mid(0, dis_left, 100)
    update_flags()
    update_rings()
    if dis_left > 10 then
        ring_t -= 1
        if ring_t <= 0 then
            spawn_rings()
            
            ring_t = 60
        end
    end

    if flr(dis_left) == 2 then
        add_water()
    end

    water:update()

    for r in all(rings) do
        if is_colliding(player.hitbox, r.hitbox) then
            if get_current_color() == r.color then
                sfx(1)
                score += 1
            else
                sfx(2)
            end
            r:on_hit()
        end
    end
end

function reset_game()
    player:reset()
    water:reset()
    --player.x = 48
    flags_passed = 0
    --player.y = 2
    --player.facing_right = false
    --player.frame = 1
    score = 0
    --needle_x = 35
    needle.x=35
    dis_left = 100
    g_state = gamestates.title
end

function check_inputs()
    if btnp(🅾️) then
        if g_state == gamestates.title then
            g_state = gamestates.game
        elseif g_state == gamestates.gameover then
            reset_game()
        end
    end
 
    if btnp(➡️) then
        if g_state == gamestates.game then
            player.frame = mid(1, player.frame + 1, 9)
        end
    elseif btnp(⬅️) then
        if g_state == gamestates.game then
            player.frame = mid(1, player.frame - 1, 9)
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

function hcenter(s)
    -- screen center minus the
    -- string length times the
    -- pixels in a char's width,
    -- cut in half
    return 64 - #s * 2
end

function vcenter(s)
    -- screen center minus the
    -- string height in pixels,
    -- cut in half
    return 61
end
