local flag = {}
flag.__index = flag

local flags = {}

local sprites = { 56, 72, 88 }

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
