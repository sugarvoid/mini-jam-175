gamestates = {
    title = 0,
    day_intro = 1,
    day_title = 2,
    game = 3,
    bonus = 4,
    gameover = 5
}
g_state = gamestates.game

frame_x = {8, 32, 56, 80, 104, 80, 56, 32, 8}
x_speeds = {}
y_speeds = {}

function _init()
    p1 = {
        x =30,
        y = 50,
        facing_right = false,
        frame=1,
        fake_frame=0,
        update=function(self)
            self.facing_right = self.frame > 5
            self.y+=.05
        end,
        update_img=function(self, dir)
            if dir == "l" then
                self.frame-=1
               -- self.frame = self.fake_frame
            else
                self.frame+=1
                --if self.frame > 5 then
                    --self.frame = (4 * self.fake_frame)
                    --self.facing_right = true
                   -- else
                 --       self.facing_right = false 
               -- end
            end
        end,
    }
end

function _update()
    check_inputs()
    p1:update()
    if p1.frame >= 6 then
        p1.facing_right = true
    end
end

-- 104, 80, 56, 32, 8

function _draw()
    cls()
    map()
        pal(14, 0)
        sspr(frame_x[p1.frame], 0, 24, 24, p1.x, p1.y, 24, 24, p1.facing_right)
        pal()
 
    
    print(p1.frame, 8, 8, 7)
end

function check_inputs()
    if btnp(🅾️) then
        if g_state == gamestates.title then
            g_state = gamestates.day_intro
        elseif g_state == gamestates.day_intro then
            intro_t = 0
        elseif g_state == gamestates.day_title then
            day_t = 0
        elseif g_state == gamestates.game then

        elseif g_state == gamestates.gameover then

        end
    end
    if btnp(❎) then
        if g_state == gamestates.title then

        elseif g_state == gamestates.day_intro then

        elseif g_state == gamestates.day_title then

        elseif g_state == gamestates.game then

        elseif g_state == gamestates.gameover then

        end
    end


    if btnp(➡️) then
        if g_state == gamestates.title then

        elseif g_state == gamestates.day_intro then

        elseif g_state == gamestates.day_title then

        elseif g_state == gamestates.game then
            --p1:update_img("r")
            p1.frame = mid(1, p1.frame + 1, 9)
            --p1.x += 1.5
            --p1.frame+=1
            --p1.f=false
        elseif g_state == gamestates.gameover then

        end
    elseif btnp(⬅️) then
        if g_state == gamestates.title then

        elseif g_state == gamestates.day_intro then

        elseif g_state == gamestates.day_title then

        elseif g_state == gamestates.game then
            p1.frame = mid(1, p1.frame - 1, 9)
            --p1.x -= 1.5
            --p1:update_img("l")
            --p1.frame-=1
            --p1.facing_l=false
        elseif g_state == gamestates.gameover then

        end
    end
end
