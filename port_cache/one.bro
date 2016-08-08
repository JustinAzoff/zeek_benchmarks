global tab: table[count] of port;
global p = 1234/tcp;
function addp(x: count)
{
    tab[x] = p;
}

local x = 0;
while ( ++x < 1000000 ) {
    addp(x);
}
