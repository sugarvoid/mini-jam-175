local ring={}
ring.__index=ring

local rings = {}

local x_pos = {0+2, 48,96-2}
local colors = {11,8,10}

local function add_ring(x, c)
    local _r=setmetatable({},ring)
    _r.x=x
    _r.y=128
    _r.h=8
    _r.w=32
    _r.color=c
    _r.was_hit=false
    add(rings, _r)
end

function spawn_rings()
    shuffle_table(x_pos)
    shuffle_table(colors)

    add_ring(x_pos[1], colors[1])
    add_ring(x_pos[2], colors[2])
end

function ring:update()
    if self.y >= -12 then
        self.y -= (y_speeds[player.frame] + 1.3)
    else
        del(rings,self)
    end
end

function ring:on_hit()
    del(objects.front,self)
    player:take_damage()
end

function ring:draw_front()
    pal(6, self.color)
    sspr( 24, 28, 32, 4, self.x, self.y, 32, 4)
    pal()
end

function ring:draw_back()
    pal(6, self.color)
    sspr( 24, 28, 32, 4, self.x, self.y-4, 32, 4, false, true)
    pal()
end

function update_rings()
    for w in all(rings) do
        w:update()
    end
end

function draw_rings_back()
    for w in all(rings) do
        w:draw_back()
    end
end

function draw_rings_front()
    for w in all(rings) do
        w:draw_front()
    end
end