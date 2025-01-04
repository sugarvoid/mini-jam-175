

ring={}
ring.__index=ring

rings = {}

x_pos = {0+2, 48,96-2}
colors = {3,8,12}

function add_ring(x, c)
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
        self.y -= (y_speeds[p1.frame] + 1.3)
    else
        del(rings,self)
    end
end

function ring:on_hit()
    del(objects.front,self)
    p1:take_damage()
end

function ring:draw_front()
    pal(6, self.color)
    sspr( 24, 28, 32, 4, self.x, self.y, 32, 4)
    --sspr( 24, 28, 32, 4, self.x, self.y-4, 32, 4, false, true)
    pal()
end

function ring:draw_back()
    pal(6, self.color)
    --sspr( 24, 28, 32, 4, self.x, self.y, 32, 4)
    sspr( 24, 28, 32, 4, self.x, self.y-4, 32, 4, false, true)
    pal()
end

function update_rings()
    for w in all(rings) do
        w:update()
        --l:draw()
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