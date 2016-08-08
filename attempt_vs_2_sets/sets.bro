type Scan_Info: record {
    hosts: table[addr] of set[port];
    ports: table[port] of set[addr];
};
global tab: table[count] of Scan_Info;
function addp(x: count)
{
    local si: Scan_Info;
    local hosts: table[addr] of set[port];
    local ports: table[port] of set[addr];

    hosts = table();
    hosts[1.1.1.1] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.3] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.4] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.5] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.6] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.7] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.8] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.9] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.10] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.11] = set(22/tcp, 2222/tcp);
    hosts[1.1.1.12] = set(22/tcp, 2222/tcp);

    ports = table();
    ports[22/tcp] = set(1.1.1.1, 1.1.1.2, 1.1.1.3, 1.1.1.4, 1.1.1.5, 1.1.1.6, 1.1.1.7, 1.1.1.8, 1.1.1.9, 1.1.1.10, 1.1.1.11, 1.1.1.12);
    ports[2222/tcp] = set(1.1.1.1, 1.1.1.2, 1.1.1.3, 1.1.1.4, 1.1.1.5, 1.1.1.6, 1.1.1.7, 1.1.1.8, 1.1.1.9, 1.1.1.10, 1.1.1.11, 1.1.1.12);

    si = Scan_Info($hosts=hosts, $ports=ports);
    tab[x] = si;
}

local x = 0;
while ( ++x < 200000 ) {
    addp(x);
}
