pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--dodgem
--by niarkou

size = 3
tile_size = flr(112/size)
board_size = tile_size*size
tiles = {}
click = {}

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
    init_tiles()
    poke(0x5f2d, 1)
    state = "player"
end

function _update()
    player_click()
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
    draw_debug()
    spr(2,stat(32)-1,stat(33)-1)
end

function init_tiles()
    for i = 1, size do
        for j = 1, size do
            tiles[i*16 + j] = 0
        end
    end
    for j = 1, size - 1 do
        tiles[1*16 + j] = 1 -- ai
    end
    for i = 2, size do
        tiles[i*16 + size] = 2 -- player
    end
end

function player_click()
    if stat(34) == 1 then
        add(click, stat(32))
        add(click, stat(33))
    end
end

function rules(piece, place)
    if tiles[place] != 0 then
        return false
    elseif place == piece + 1 then
        return true
    elseif place == piece - 16 then
        return true
    elseif tiles[piece] == 1 and place == piece + 16 then
        return true
    elseif tiles[piece] == 2 and place == piece - 1 then
        return true
    else
        return false
    end
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

function draw_debug()
    print(click[1], 5, 5, 0)
    print(click[2], 5, 12, 0)
end

__gfx__
00000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100001710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001110001771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000011111001777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001110001777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100001777710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001771100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000117100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
