
function a(): bool
{
    return T;
}

function b(): bool
{
    return T;
}

function go()
{
    a();
    b();
}

event bro_init()
{
    local x = 0;
    while ( x < 2000000 ) {
        ++x;

        go();
    }
}
