@load base/utils/site

redef Site::local_nets = {
    172.24.0.0/13,
    [2620:0:c80::]/48,
    141.142.0.0/16,
    10.0.0.0/8
};

redef Site::neighbor_nets += {
    # DOW network
    143.219.0.0/16,

    #Urbana-Champaign campus
    128.174.0.0/16,
    130.126.0.0/16,
    192.17.0.0/16,
    72.36.64.0/18,
    [2620:0:e00::]/48,
    # Campus's half of 172.16.0.0/12
    172.16.0.0/13,

    #University-wide shared services
    64.22.176.0/20,
    204.93.0.0/19,
    [2620:79:8000::]/48,

    # University of Illinois at Chicago

    128.248.0.0/16,
    131.193.0.0/16,
    192.43.252.0/24,
    65.79.120.0/22,
    64.107.204.0/22,

    #University of Illinois at Springfield

    69.67.112.0/20,
    192.102.230.0/24,
};

const scan_threshold = 25;

function get_thresh(ip: addr): count
{
    return scan_threshold;
}
function check_thresh(ip: addr, c: count): bool
{
    local t = get_thresh(ip);
    return (c >= t);
}

local x = 0;
local y = 0;
local ip1 = 141.142.2.2;
local ip2 = 128.248.2.2;
local ip3 = 1.2.3.4;
while ( x < 2000000 ) {
    ++x;
    if(check_thresh(ip1, 40))
        ++y;
    if(check_thresh(ip2, 40))
        ++y;
    if(check_thresh(ip3, 40))
        ++y;
}
