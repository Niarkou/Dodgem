pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--dodgem
--by niarkou

function _init()
    size = 8
end

function _update()

end

function _draw()
    cls(7)
    local s = flr(112/size)
    rectfill(8, 8, 8 + s*size - 1, 8 + s*size - 1, 15)
    for x = 0, size - 1 do
        for y = 0, size - 1 do
            tx,ty=8+x*s,8+y*s
 -- draw board tile
            if ((x+y)%2==0) then
                rectfill(tx,ty,tx+s-1,ty+s-1,2)
            end
        end
    end
end
