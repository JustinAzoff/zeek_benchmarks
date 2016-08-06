function check_port(p: port): bool
{
    return (p == 1/tcp || p == 2/tcp || p == 3/tcp);
}
local x = 0;
local p = 22/tcp;
while ( x < 2000000 ) {
    if (!check_port(p))
        ++x;
}
