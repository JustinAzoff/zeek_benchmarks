function check_port(p: port): bool
{
    return (p == 22/tcp);
}

local p22 = 22/tcp;
local p3389 = 3389/tcp;
local x = 0;
while ( x < {{ N }} ) {
    if (check_port(p22))
        ++x;

    if (check_port(p3389))
        ++x;
}
