const scan_ports: set[port] = {22/tcp,3389/tcp};
function check_port(p: port)
{
    add scan_ports[p];
}

local p10 = 10/tcp;
local p3389 = 3389/tcp;
local x = 0;
while ( ++x < 10000000 ) {
    check_port(p10);
    check_port(p3389);
}
