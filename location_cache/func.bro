@load base/utils/site
@load base/utils/geoip-distance

redef Site::local_nets = {
    172.24.0.0/13,
    [2620:0:c80::]/48,
    141.142.0.0/16,
    10.0.0.0/8
};

function check(ip: addr): double
{
    return haversine_distance_ip(ip, 1.2.3.4);
}

local x = 0;
local ip = 141.142.2.2;
while ( x < 2000000 ) {
    check(ip);
    ++x;
}
