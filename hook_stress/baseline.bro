global check_port: hook(p: port);

local x = 0;
local p = 22/tcp;
while ( x < 2000000 ) {
    ++x;
}
