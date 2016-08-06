global hlls: table[count] of set[addr];
local x = 0;
while ( ++x < 100000 ) {
    hlls[x] = set();
    add hlls[x][1.2.3.1];
    add hlls[x][1.2.3.2];
}
