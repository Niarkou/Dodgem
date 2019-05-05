pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--dodgem
--by niarkou

function _init()
    size = 5
end

function _update()

end

function _draw()
    cls(7)
    rectfill(8, 8, 119, 119, 15)
    for i = 0, size - 1, 2 do
        for j = 0, size - 1, 2 do
            rectfill(8 + i*(112/size), 8 + j*(112/size), 8 + (i + 1)*(112/size), 8 + (j + 1)*(112/size), 1)
        end
    end
    for i = 0, size - 2, 2 do
        for j = 0, size - 2, 2 do
            rectfill(8 + (112/size) + i*(112/size), 8 + (112/size) + j*(112/size), 8 + (112/size) + (i + 1)*(112/size), 8 + (112/size) + (j + 1)*(112/size), 1)
        end
    end
end
