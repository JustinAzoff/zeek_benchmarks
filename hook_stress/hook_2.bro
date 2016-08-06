global check_port: hook(p: port);

hook check_port(p: port)
{
    if (p == 1/tcp)
        break;
}

hook check_port(p: port)
{
    if (p == 2/tcp)
        break;
}

local x = 0;
local p = 22/tcp;
while ( x < 2000000 ) {
    if (hook check_port(p))
        ++x;
}
