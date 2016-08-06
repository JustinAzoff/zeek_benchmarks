global check_port: hook(p: port);

hook check_port(p: port)
{
    if (p != 22/tcp)
        break;
}

local x = 0;
local p22 = 22/tcp;
local p3389 = 3389/tcp;
while ( x < 2000000 ) {
    if (hook check_port(p22))
        ++x;

    if (hook check_port(p3389))
        ++x;
}
