local p22 = 22/tcp;
local p3389 = 3389/tcp;
local x = 0;
while ( x < 2000000 ) {
    if (p22 == 22/tcp)
        ++x;

    if (p3389 == 22/tcp)
        ++x;
}
