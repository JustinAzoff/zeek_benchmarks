type Scan_Info: record {
    dark_hosts: set[addr];
    hosts: table[addr] of set[port];
    ports: table[port] of set[addr];
};
global tab: table[count] of Scan_Info;
function addp(x: count)
{
    local si: Scan_Info;
    local hosts: table[addr] of set[port];
    local ports: table[port] of set[addr];
    local dark_hosts: set[addr];

    dark_hosts = set();
    add dark_hosts[1.2.3.4];


    hosts = table();
    hosts[1.2.3.4] = set(22/tcp, 2222/tcp);
    hosts[5.6.7.8] = set(22/tcp, 2222/tcp);

    ports = table();
    ports[22/tcp] = set(1.2.3.4, 5.6.7.8);
    ports[2222/tcp] = set(1.2.3.4, 5.6.7.8);

    si = Scan_Info($dark_hosts=dark_hosts, $hosts=hosts, $ports=ports);
    tab[x] = si;
}

local x = 0;
while ( ++x < 1000000 ) {
    addp(x);
}
