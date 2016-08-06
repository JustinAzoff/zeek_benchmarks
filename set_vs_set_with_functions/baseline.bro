function check_port(p: port): bool
{
    return T;
}

local p10 = 10/tcp;
local p3389 = 3389/tcp;
local x = 0;
while ( x < 2000000 ) {
    if(check_port(p10))
        ++x;
}
