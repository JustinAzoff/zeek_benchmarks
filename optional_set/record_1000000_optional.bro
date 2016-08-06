type Attempt: record {
    victim: addr;
    scanned_port: port;
};
## Information tracked for each scanner
type Scan_Info: record {
    attempts: set[Attempt];
    dark_hosts: set[addr] &optional;
};
global data: table[count] of Scan_Info;
local x = 0;
while ( ++x < 1000000 ) {
    local attempts: set[Attempt] = set();
    local si = Scan_Info($attempts=attempts);
    data[x] = si;
    add attempts[Attempt($victim=1.2.3.1, $scanned_port=22/tcp)];
    add attempts[Attempt($victim=1.2.3.2, $scanned_port=22/tcp)];
    add attempts[Attempt($victim=1.2.3.3, $scanned_port=22/tcp)];
    add attempts[Attempt($victim=1.2.3.4, $scanned_port=22/tcp)];
    add attempts[Attempt($victim=1.2.3.5, $scanned_port=22/tcp)];
}
