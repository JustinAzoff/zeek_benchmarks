function check_port(p: port): bool
{
    return T;
}
local x = 0;
local p10 = 10/tcp;
local p3389 = 3389/tcp;
while ( x < 2000000 ) {
    if (check_port(p10))
        ++x;
}
