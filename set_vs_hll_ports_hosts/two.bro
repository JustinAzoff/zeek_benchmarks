type Scan_Info: record {
    dark_hosts: opaque of cardinality;
    hosts: table[addr] of opaque of cardinality;
    ports: table[port] of opaque of cardinality;
};
global tab: table[count] of Scan_Info;
function addp(x: count)
{
    local si: Scan_Info;
    local hosts: table[addr] of opaque of cardinality;
    local ports: table[port] of opaque of cardinality;
    local dark_hosts: opaque of cardinality;

    dark_hosts = hll_cardinality_init(0.1, 0.99);
    hll_cardinality_add(dark_hosts, 1.2.3.4);


    hosts = table();
    hosts[1.2.3.4] = hll_cardinality_init(0.1, 0.99);
    hosts[5.6.7.8] = hll_cardinality_init(0.1, 0.99);

    hll_cardinality_add(hosts[1.2.3.4], 22/tcp); hll_cardinality_add(hosts[1.2.3.4], 2222/tcp);
    hll_cardinality_add(hosts[5.6.7.8], 22/tcp); hll_cardinality_add(hosts[5.6.7.8], 2222/tcp);

    ports = table();
    ports[22/tcp] = hll_cardinality_init(0.1, 0.99);
    hll_cardinality_add(ports[22/tcp], 1.2.3.4);
    hll_cardinality_add(ports[22/tcp], 5.6.7.8);

    si = Scan_Info($dark_hosts=dark_hosts, $hosts=hosts, $ports=ports);
    tab[x] = si;
}

local x = 0;
while ( ++x < 1000000 ) {
    addp(x);
}
