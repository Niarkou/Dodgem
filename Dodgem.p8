pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--dodgem
--by niarkou

size = 3
tile_size = flr(112/size)
board_size = tile_size*size
tiles = {}

player_1 = {    x = (128 - board_size) / 2 + tile_size + tile_size / 2,
                y = (128 - board_size) / 2 + tile_size * 2 + tile_size / 2
}

player_2 = {    x = (128 - board_size) / 2 + tile_size * 2 + tile_size / 2,
                y = (128 - board_size) / 2 + tile_size * 2 + tile_size / 2
}

ai_1 = {    x = (128 - board_size) / 2 + tile_size / 2,
                y = (128 - board_size) / 2 + tile_size / 2
}

ai_2 = {    x = (128 - board_size) / 2 + tile_size / 2,
                y = (128 - board_size) / 2 + tile_size + tile_size / 2
}

function _init()
    
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
    draw_player()
    draw_ai()
end

function draw_player()
    spr(1, player_1.x, player_1.y)
    spr(1, player_2.x, player_2.y)
end

function draw_ai()
    pal(1, 8)
    spr(1, ai_1.x, ai_1.y)
    spr(1, ai_2.x, ai_2.y)
    pal()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
