pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--plane's descent
--by sugarvoid

#include src/main.lua
#include src/plane.lua
#include src/ring.lua
#include src/flag.lua
#include src/water.lua
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000000000000000000000000000000000000000000000000000000000000000000000000000eee00000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000ee00000000000000000e77ee0000000000000000000eeee0000000eeee00000
007007000000000000000000000000000000000000000ee000000000000000000e7e0000000000000000e7777e000000000000000000e777eee0eee777e00000
0000000000000000000000000eee0000000000000000e7e00000000000000000e777e000000000000000e7777eeeeeeeeee000000000e77777e0e77777e00000
00000000000000000000000ee77e000000000000000e77e00000000000000000e777e000000000000000e7777ee7777777e0000000000e7777e7e7777e000000
000000000000000000000ee7777e00000000000000e777e0000000000000000e77777eeee00000000000e7777ee777777e00000000000e7777e7e7777e000000
0000000000000000000ee77777e00000000000000e7777e0000000000000000e7777ee777eee00000000e777ee777777e0000000000000e777e7e777e0000000
00000000000000000ee7777777e0000000000000e77777e000000000000000e7777ee777777e00000000e777ee77777e00000000000000e7777e7777e0000000
000000000000000ee77777777e0000000000000e77777eeee0000000000000e777ee77777ee000000000e777e77777e0000000000000000e777e777e00000000
0000000000000ee7777777eeeee00000000000e7777eee777ee0000000000e777ee77777ee0000000000e77ee7777e00000000000000000e777e777e00000000
00000000000ee77777eeee77777ee00000000e7777ee7777777eee0000000e777e77777e000000000000e77e7777e0000000000000000000e77e77e000000000
000000000ee777777777777777777e000000e777ee77777777777e000000e777e7777ee0000000000000e77e777e00000000000000000000e77e77e000000000
00000000e777777777777777777777e0000e777e77777777eeeee0000000e7777777e000000000000000e77777e0000000000000000000000e777e0000000000
00000000eeeeeeeeeeeeeeeeeeeeeee000e777777777eeee00000000000e777777ee0000000000000000e7777e00000000000000000000000e777e0000000000
000000000000000eeeee77777e0000000e777777eeee77e000000000000e77777e000000000000000000e777e0000000000000000000000000e7e00000000000
00000000000000000000eeeeee000000e777eeeeeeeeeee00000000000e7777ee0000000000000000000e77e00000000000000000000000000e7e00000000000
00000000000000000000000000000000eeee0000000000000000000000e77ee000000000000000000000e7e0000000000000000000000000000e000000000000
00000000000000000000000000000000000000000000000000000000000ee00000000000000000000000ee000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000eeeee0000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000eeeeee6666e00000eeeeeeeeeee00000eeeeee0000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000e666666666e00000e666666666e00000e66666eeeee00000000000000000000000000000
00000000000000000000000000000000000000000000000000000000e666666666e00000e666666666e00000e666666666e00000000000000000000000000000
000000000000000000000000eeeeeeee000000000000000000000000e666666666e00000e666666666e00000e666666666e00000000000000000000000000000
00000000000000000000000066666666000000000000000000000000e66666eeeee00000e666666666e00000e666666666e00000000000000000000000000000
000000000000000000000000eeeeeeee000000000000000000000000eeeeee0000000000eeeeeeeeeee00000eeeeee6666e00000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000eeeee00000000000000000000000000000
55555555555555555555555555555555151115110000000000000000e0e0e0e0e0e0e0e00e0e0e0e0e0e0e0e0000000000000000000000000000000000000000
566666ccccccccccccccccccccccccc51511151100000000000000001e1e1e1e1e1e1e1ee1e1e1e1e1e1e1e10000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5555555550000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5115111510000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5115111510000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5555555550000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5111511150000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5111511150000707770700000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000077777777777000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000777777777777700111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000777777777777770111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000007777777777777777111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000000000000000000111111111111111111111111111111110000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5000000000666666600000000000000000000000000000000000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666660000000000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
544446ccccccccccccccccccccccccc5666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
54444633333333333333333333333335666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
56666666666666666666666666666665666666666666666666666666666666666666666666666666000000000000000000000000000000000000000000000000
54446644444444444444444444444445666666666000000066666666666666666666666666666666000000000000000000000000000000000000000000000000
54464644444444444444444444444445000000000000000000000000000000000000000006666666000000000000000000000000000000000000000000000000
56644644444444444444444444444445000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc000000ccc000cccccccccccccccccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc000000ccc000cccccccccccccccccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccc00cc00cccccccccccccccccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccc00cc00ccccccc0000000c000000cccc00000cccccc00ccccc0000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccc00cc00ccccccc0000000c000000cccc00000cccccc00ccccc0000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc000000cccc00cccccc00cccc00c00cccc00c00cccc00cccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc000000cccc00cccccc00cccc00c00cccc00c00000000cccccccccc000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccccccc00cccccc00cccc00c00cccc00c00000000ccccccccccc00000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccccccc00cccccc00cccc00c00cccc00c00cccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccccccc0000000c00000000c00cccc00c000000cccccccccccc00000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccc00cccccccccc00000cc0000000c00cccc00cc00000cccccccccccc000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc000000ccccccccccccccccccccccccccccccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc000000ccccccccccccccccccccccccccccccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00ccccccccccccccccccccccccccccccccccccccccccccccc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00cc00000cccc0000000cc00000cccc00000ccc000000ccc000000ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00cc00000cccc0000000cc00000cccc00000ccc000000ccc000000ccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00c00cccc00c00ccccccc00cccc00c00cccc00c00cccc00cc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00c00000000c000000ccc00cccc00c00000000c00cccc00cc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00c00000000cc00000ccc00ccccccc00000000c00cccc00cc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00cccc00c00ccccccccccccc00c00cccc00c00ccccccc00cccc00cc00cccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc00000000c000000ccc00000000c00000000c000000ccc00cccc00cc0000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccc000000cccc00000ccc000000cccc00000cccc00000ccc00cccc00cccc00000ccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0cccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc070ccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0770ccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc077770cccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0777770cccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc077777770ccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777770cccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc077777777770cccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777770ccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc077777777777770ccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc007777777777777770cccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777770ccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc077777777777777777770ccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777770cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777777770ccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777777770ccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777777777770cccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777777777770cccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777777777777770ccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777777777777000ccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc077777777777777777777777777700660ccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777777777770066660ccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777777777006666660ccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccc077777777777777777777777770666666660ccc00cccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777777777006666666660c00770ccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccc077777777777777777777777006666666666600777770cccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777777006666666666600077777770ccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777777066666666666007777777777700ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777777006666666666007777777777777770cccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccc0077777777777777777777006666666660007777777777777777770ccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccc077777777777777777777006666666660077777777777777777777770cccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccc07777777777777777777006666666660077777777777777777777777770ccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccc0777777777777777777706666666660077777777777777777777777777770cccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccc0777777777777777777006666666600777777777777777777777777777777700cccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccc077777777777777777006666666000777777777777777777777777777777777770ccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccc07777777777777777006666666007777777777777777777777777777777777777770cccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccc0777777777777777706666666007777777777777777777777777777777777777777770ccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccc077777777777777700666666007777777777777777777777777777777777777777777770cccccccccccccccc
ccccccccccccccccccccccccccccccccccccccc077777777777777006666660007777777777777777777777777777777777777777777777700cccccccccccccc
cccccccccccccccccccccccccccccccccccccc07777777777777006666660077777777777777777777777777777777777777777777777777770ccccccccccccc
ccccccccccccccccccccccccccccccccccccc0777777777777006666600077777777777777777777777777777777777777777777777777777770cccccccccccc
cccccccccccccccccccccccccccccccccccc077777777777706666600777777777777777777777777777777777777777777777777777777777000ccccccccccc
ccccccccccccccccccccccccccccccccccc0777777777770066660007777777777777777777777777777777777777777777777777777700000cccccccccccccc
cccccccccccccccccccccccccccccccccc077777777770066660007777777777777777777777777777777777777777777777777700000ccccccccccccccccccc
ccccccccccccccccccccccccccccccccc07777777770066660077777777777777777777777777777777777777777777777000000cccccccccccccccccccccccc
cccccccccccccccccccccccccccccccc077777777706666007777777777777777777777777777777777777777777700000cccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccc07777777700660007777777777777777777777777777777777777777700000ccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccc077777770066000777777777777777777777777777777777777770000066660ccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccc0777777006600077777777777777777777777777777777777000006666666660ccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccc007777700660077777777777777777777777777777777700000666666666666660ccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccc0777777066007777777777777777777777777777700000066666666666666666660ccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccc07777700600777777777777777777777777770000066666666666666666666666660ccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccc077770060077777777777777777777777000006666666666666666666666666666660ccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccc0777000007777777777777777777700000666666666666666666666666666666666660ccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccc07770007777777777777777770000066666666666666666666666666666666666000000ccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccc077000777777777777777000006666666666666666666666666666660000000000ccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccc070007777777777770000066666666666666666666666600000000000ccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccc0007777777700000066666666666666666660000000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccc0077777000006666666666666600000000000cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccc00000000000000000000000000ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

__map__
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444444444444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0008000018130121300b1300613018100131000f1000a100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
000a00002c0503b050000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000b000000000060500d0000605000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000020027250282501b2501c250232502a2502f250002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200
