type Attempt: record {
    victim: addr;
    scanned_port: port;
};

type Scan_Info: record {
    attempts: set[Attempt];
};
global tab: table[count] of Scan_Info;
function addp(x: count)
{
    local si: Scan_Info;
    local attempts: set[Attempt];

    add attempts[Attempt($victim=1.1.1.1, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.1, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.2, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.2, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.3, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.3, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.4, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.4, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.5, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.5, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.6, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.6, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.7, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.7, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.8, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.8, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.9, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.9, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.11, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.11, $scanned_port=2222/tcp)];
    add attempts[Attempt($victim=1.1.1.12, $scanned_port=22/tcp)]; add attempts[Attempt($victim=1.1.1.12, $scanned_port=2222/tcp)];

    si = Scan_Info($attempts=attempts);
    tab[x] = si;
}

local x = 0;
while ( ++x < 200000 ) {
    addp(x);
}
