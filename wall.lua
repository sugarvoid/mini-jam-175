

wall={}
wall.__index=wall

walls = {}

function wall:new()
    local _w=setmetatable({},wall)
    _w.type="wall"
    _w.x=0
    _w.y=0
    _w.h=8
    _w.w=24
    _w.was_hit=false
    return _w
end

function spawn_wall()
    --local _w=wall:new(rnd(avil_yx),128)
    local _w=wall:new()
    _w.y=128
    _w.x=rnd({0, 41,128-40})
    add(walls,_w)
end

function wall:update()
    if self.y >= -12 then
        self.y -= (y_speeds[p1.frame] + 0.5)
    else
        del(walls,self)
    end
end

function wall:on_hit()
    del(objects.front,self)
    p1:take_damage()
end

function wall:draw()
    --spr(51, self.x, self.y)
    sspr( 24, 24, 8, 8, self.x, self.y, (8*5), 8)
end

function update_walls()
    for w in all(walls) do
        w:update()
        --l:draw()
    end
end

function draw_walls()
    for w in all(walls) do
        w:draw()
        --l:draw()
    end
end
