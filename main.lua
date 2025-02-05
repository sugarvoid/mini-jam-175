local gamestates = {
    title = 0,
    game = 3,
    gameover = 5
}

local g_state = gamestates.title
local title = "plane's descent"
local sub_title = "mini jam 175"
local frame_x = { 8, 32, 56, 80, 104, 80, 56, 32, 8 }
local y_speeds = { 0.2, 0.3, 0.4, 0.5, 1.5, 0.5, 0.4, 0.3, 0.2 }
local dx = { -2.5, -2, -1.5, -1, 0, 1, 1.5, 2, 2.5 }
local score = 0
local dis_left = 100
local flags_passed = 0
local x_pos = { 0 + 2, 48, 96 - 2 }
local colors = { 11, 8, 10 }
local ranges = {
    green = { 32, 52 },
    red = { 53, 73 },
    yellow = { 74, 94 }
}
local sprites = { 56, 72, 88 }
local ring_t = 60

-- Classes
local ring = {}
ring.__index = ring
local rings = {}

local flag = {}
flag.__index = flag
local flags = {}

local player = {
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


local function add_ring(x, c)
    local _r = setmetatable({}, ring)
    _r.x = x
    _r.y = 140
    _r.h = 2
    _r.w = 32
    _r.color = c
    _r.line = { x1 = 0, y1 = 0, x2 = 0, y2 = 0 }
    _r.hitbox = { x = 0, y = 0, w = 30, h = 2 }
    _r.was_hit = false
    add_flag(x, c)
    add_flag(x + 31, c)
    add(rings, _r)
end

local function spawn_rings()
    shuffle_table(x_pos)
    shuffle_table(colors)

    flags_passed += 1

    add_ring(x_pos[1], colors[1])
    add_ring(x_pos[2], colors[2])
    add_ring(x_pos[3], colors[3])
end

function ring:update()
    if self.y >= -12 then
        self.y -= (y_speeds[player.frame] + 1.3)
        self.hitbox.x = self.x
        self.hitbox.y = self.y + 5
    else
        del(rings, self)
    end
end

function ring:on_hit()
    del(rings, self)
end

function ring:draw()
    pal(6, self.color)
    pal(14, 0)
    spr(51, self.x, self.y)
    for i = 1, 3, 1 do
        spr(51, self.x + (8 * i), self.y)
    end
    pset(self.x, self.y + 5, 5)
    pset(self.x + 31, self.y + 5, 5)
    pal()
end

function update_rings()
    for w in all(rings) do
        w:update()
    end
end

function draw_rings()
    for w in all(rings) do
        w:draw()
    end
end

function add_flag(x, c)
    local _f = setmetatable({}, flag)
    _f.x = x
    _f.y = 124
    _f.flip_state = rnd { 1, 2, 3 }
    _f.move_t = 3
    _f.color = c
    add(flags, _f)
end

function flag:update()
    if self.y >= -15 then
        self.y -= (y_speeds[player.frame] + 1.3)
    else
        del(flags, self)
    end
    self.move_t += 1
    if (self.move_t % 10 == 0) then
        self.flip_state += 1
        if self.flip_state == 4 then
            self.flip_state = 1
        end
    end
end

function flag:on_hit()
    del(objects.front, self)
end

function flag:draw()
    line(self.x, self.y, self.x, self.y + 20, 0)
    pal(14, 0)
    pal(6, self.color)
    sspr(sprites[self.flip_state], 24, 11, 8, self.x, self.y, 11, 8)
    pal()
end

function update_flags()
    for f in all(flags) do
        f:update()
    end
end

function draw_flags()
    for f in all(flags) do
        f:draw()
    end
end

local water = {
    in_play = false,
    y = 130,
    x = 0,
    update = function(self)
        if self.in_play then
            if self.y >= 128 - 30 then
                self.y -= (y_speeds[player.frame] + 1.3)
            end

            player.y += (y_speeds[player.frame] + 1.5)
        end
    end,
    draw = function(self)
        if self.in_play then
            for i = 0, 12, 1 do
                pal(14, 0)
                sspr(56, 32, 16, 16, self.x + (16 * i), self.y, 16, 16)
                pal()
                rectfill(0, self.y + 16, 128, self.y + 32, 1)
            end
        end
    end,
    reset = function(self)
        self.y = 130
        self.in_play = false
    end
}

function add_water()
    water.y = 130
    water.in_play = true
    sfx(3)
end

local needle = {
    x = 35,
    y = 0,
    speed = 0.4,
    update = function(self)
        self.x += self.speed
        if self.x >= 94 or self.x <= 32 then
            self:reverse_dir()
        end
    end,
    reverse_dir = function(self)
        self.speed *= -1
    end,
    draw = function(self)
        line(self.x, 121 - 1, self.x, 121 + 7, 7)
    end
}


local hud = {
    bar_y1 = 128 - 7,
    draw = function(self)
        rectfill(0, self.bar_y1 - 2, 128, 128, 0)
        rectfill(32, self.bar_y1, 32 + 20, self.bar_y1 + 5, 11)
        rectfill(53, self.bar_y1, 53 + 20, self.bar_y1 + 5, 8)
        rectfill(74, self.bar_y1, 74 + 20, self.bar_y1 + 5, 10)
        needle:draw()
        print(flr(dis_left) .. "ft", 100, self.bar_y1, get_current_color())
    end,
}


function _init()
    poke(0x5f5c, 255)
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
    print("score: " .. score .. "/" .. flags_passed, hcenter("score: " .. score .. "/10"), 60, 7)
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
    flags_passed = 0
    score = 0
    needle.x = 35
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
