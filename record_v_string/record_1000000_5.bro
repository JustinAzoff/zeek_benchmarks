type Attempt: record {
    victim: addr;
    scanned_port: port;
};
global data: table[count] of set[Attempt];
local x = 0;
while ( ++x < 1000000 ) {
    data[x] = set();
    add data[x][Attempt($victim=1.2.3.1, $scanned_port=22/tcp)];
    add data[x][Attempt($victim=1.2.3.2, $scanned_port=22/tcp)];
    add data[x][Attempt($victim=1.2.3.3, $scanned_port=22/tcp)];
    add data[x][Attempt($victim=1.2.3.4, $scanned_port=22/tcp)];
    add data[x][Attempt($victim=1.2.3.5, $scanned_port=22/tcp)];
}
