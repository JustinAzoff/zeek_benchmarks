const scan_ports: set[port] = {22/tcp,3389/tcp};

local x = 0;
local p10 = 10/tcp;
local p3389 = 3389/tcp;
while ( x < {{ N }} ) {
    if (p10 in scan_ports);
        ++x;

    if (p3389 in scan_ports);
        ++x;
}
