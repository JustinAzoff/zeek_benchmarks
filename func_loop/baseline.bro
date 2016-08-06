function go()
{
}

event bro_init()
{
    local x = 0;
    while ( x < 2000000 ) {
        ++x;

        go();
    }
}
