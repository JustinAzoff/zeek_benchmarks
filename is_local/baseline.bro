@load base/utils/site

redef Site::local_nets = {
    172.24.0.0/13,
    [2620:0:c80::]/48,
    141.142.0.0/16,
    10.0.0.0/8
};

function check(ip: addr): bool
{
    return T;
}

local x = 0;
local ip = 1.2.3.4;
while ( x < 10000000 ) {
    if(check(ip))
        ++x;
}
