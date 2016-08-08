global tab: table[count] of port;
function addp(x: count)
{
    local p = 1234/tcp;
    tab[x] = p;
}

local x = 0;
while ( ++x < 1000000 ) {
    addp(x);
}
