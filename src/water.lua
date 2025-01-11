water = {
    in_play = false,
    y = 130,
    x=0,
    update = function(self)
        if self.in_play then
            if self.y >= 128-30 then
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
                rectfill(0,self.y+16, 128, self.y+32, 1)
            end
        end
    end,
    reset=function(self)
        self.y = 130
        self.in_play = false
    end
}


function add_water()
    water.y = 130
    water.in_play = true
    sfx(3)
end




