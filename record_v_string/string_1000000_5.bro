global data: table[count] of set[string];
local x = 0;
while ( ++x < 1000000 ) {
    data[x] = set();
    add data[x][cat(1.2.3.1, "/", 22/tcp)];
    add data[x][cat(1.2.3.2, "/", 22/tcp)];
    add data[x][cat(1.2.3.3, "/", 22/tcp)];
    add data[x][cat(1.2.3.4, "/", 22/tcp)];
    add data[x][cat(1.2.3.5, "/", 22/tcp)];
}
