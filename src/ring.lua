local ring = {}
ring.__index = ring

rings = {}

--R_COUNT = 0

local x_pos = { 0 + 2, 48, 96 - 2 }
local colors = { 11, 8, 10 }

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


function spawn_rings()
    shuffle_table(x_pos)
    shuffle_table(colors)

    flags_passed+=1

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
    --TODO: add particles
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
