@load base/utils/site

redef Site::local_nets = {
    172.24.0.0/13,
    [2620:0:c80::]/48,
    141.142.0.0/16,
    10.0.0.0/8
};

function check(ip: addr): bool
{
    return Site::is_local_addr(ip) && Site::is_local_addr(ip);
}

local x = 0;
local ip = 141.142.2.2;
while ( x < {{ N }}  ) {
    if(check(ip))
        ++x;
}
