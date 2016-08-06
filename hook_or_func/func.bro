function check_port(p: port): bool
{
    return (p == 22/tcp);
}

local x = 0;
local p22 = 22/tcp;
local p3389 = 3389/tcp;
while ( x < 2000000 ) {
    if (check_port(p22))
        ++x;

    if (check_port(p3389))
        ++x;
}
