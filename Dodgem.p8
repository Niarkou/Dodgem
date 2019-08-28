pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--dodgem
--by niarkou

function _init()
    size = 3
    tile_size = flr(112/size)
    board_size = tile_size*size
    tiles = {}
    --tiles_num()
end

function _update()

end

function _draw()
    cls(7)
    local o = (128 - board_size) / 2
    rectfill(o, o, o + board_size - 1, o + board_size - 1, 15)
    for x = 0, size - 1 do
        for y = 0, size - 1 do
            tx,ty=o+x*tile_size,o+y*tile_size
 -- draw board tile
            if ((x+y)%2==0) then
                rectfill(tx,ty,tx+tile_size-1,ty+tile_size-1,2)
            end
        end
    end
end