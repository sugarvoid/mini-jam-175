local flag={}
flag.__index=flag

local flags = {}

local x_pos = {0+2, 48,96-2}
local colors = {11,8,10}

local function add_flag(x, c)
    local _f=setmetatable({},flag)
    _f.x=x
    _f.y=128
    _f.y2=128
    _f.h=8
    _f.w=32
    _f.move_t=3
    _f.color=c
    _f.was_hit=false
    add(flags, _f)
end

function spawn_flags()
    shuffle_table(x_pos)
    shuffle_table(colors)

    add_flag(x_pos[1], colors[1])
    add_flag(x_pos[2], colors[2])
end

function flag:update()
    if self.y >= -12 then
        self.y -= (y_speeds[player.frame] + 1.3)
    else
        del(flags,self)
    end


    self.move_t-=1

    -- FIXME: make this work (flag animation)   

    if self.move_t <= 0 then
        
    end
    self.y2 = self.y-1
    self.y2 = self.y
    self.y2 = self.y+1

end

function flag:on_hit()
    del(objects.front,self)
    player:take_damage()
end

function flag:draw()
    pal(6, self.color)
    sspr( 24, 28, 32, 4, self.x, self.y, 32, 4)
    spr(55, self.x, self.y)
    spr(55, self.x+8, self.y2)
    pal()
end

function flag:draw_back()
    pal(6, self.color)
    sspr( 24, 28, 32, 4, self.x, self.y-4, 32, 4, false, true)
    pal()
end

function update_flags()
    for w in all(flags) do
        w:update()
    end
end

function draw_flags_back()
    for w in all(flags) do
        w:draw_back()
    end
end

function draw_flags_front()
    for w in all(flags) do
        w:draw_front()
    end
end