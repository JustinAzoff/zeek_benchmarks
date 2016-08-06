local x = 0;
local p10 = 10/tcp;
local p3389 = 3389/tcp;
while ( x < 2000000 ) {
    if (p10 == 22/tcp || p10 == 3389/tcp)
        ++x;

    if (p3389 == 22/tcp || p3389 == 3389/tcp)
        ++x;
}
